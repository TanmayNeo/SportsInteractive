//
//  MatchDetailsViewController.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 02/03/23.
//

import UIKit

class MatchDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var teamFilter : UISegmentedControl!
    
    var viewModel : MatchDetailsViewModel!
    var playerArray : [Player]?
    var numberOfSections : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentControl()
        setupUI()
     
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        self.title = Constants.matchDetail
        tableView.register(UINib(nibName: Constants.matchDetailsCell, bundle: nil),
                           forCellReuseIdentifier: Constants.matchDetailsCell)
    }
    
    func setupSegmentControl () {
        teamFilter.removeAllSegments()
        teamFilter.insertSegment(withTitle: "Both", at: 0, animated: false)
        teamFilter.insertSegment(withTitle: viewModel.getHomeTeamName(), at: 1, animated: false)
        teamFilter.insertSegment(withTitle: viewModel.getAwayTeamName(), at: 2, animated: false)
        teamFilter.selectedSegmentIndex = 1
        selectTeam(teamFilter)
    }
    

    @IBAction func selectTeam(_ sender: Any) {
        
        switch teamFilter.selectedSegmentIndex {
        case 0 :
            self.numberOfSections = 2
            self.playerArray = viewModel.getBothTeams()
            self.tableView.reloadData()
            
        case 1 :
            self.numberOfSections = 1
            self.playerArray = viewModel.getTeamHomePlayer()
            self.tableView.reloadData()
        case 2 :
            self.numberOfSections = 1
            self.playerArray = viewModel.getTeamAwayPlayer()
            self.tableView.reloadData()
        default:
            break
        }
    }
    

}

extension MatchDetailsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let vc = PlayerDetailsViewController(nibName: Constants.playerDetailsViewController, bundle: nil)
        vc.player = playerArray?[indexPath.row]
        self.present(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0 :
            return viewModel.getHomeTeamName()
        case 1 :
            return viewModel.getAwayTeamName()
        default:
            break
        }
        return ""
    }
}

extension MatchDetailsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return viewModel.getTeamHomePlayer()?.count ?? 0
        default :
            break
        }
        return playerArray?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.matchDetailsCell) as! MatchDetailsCell
        if teamFilter.selectedSegmentIndex == 0 {
            switch indexPath.section {
            case 0 :
                cell.setupContents(player: viewModel.getTeamHomePlayer(), index: indexPath.row)
            case 1 :
                cell.setupContents(player: viewModel.getTeamAwayPlayer(), index: indexPath.row)
            default :
                break
            }
        } else {
            cell.setupContents(player: playerArray, index: indexPath.row)
        }
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.numberOfSections ?? 1
    }
}
