//
//  MatchListViewController.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 01/03/23.
//

import UIKit

class MatchListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private lazy var viewModel : MatchListViewModel = {
        return MatchListViewModel(repository: Repository())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        callbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getMatchDetails()
    }
    
    ///To set up the navigation title and register XIB cells for the table view
    func setup (){
        self.title = Constants.matchList
        tableView.register(UINib(nibName: Constants.matchListCell, bundle: nil),
                           forCellReuseIdentifier: Constants.matchListCell)
    }
    
    ///To reload the table after the data from the API call has been received
    func callbacks(){
        viewModel.reloadTable = {
            self.tableView.reloadData()
        }
    }

}

/// To setup the count of cells and height of the table view
extension MatchListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matchesArray.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.matchListCell) as! MatchListCell
        let team =  viewModel.matchesArray[indexPath.row]
        let teamHome = team.teams[team.matchdetail.teamHome]?.nameShort ?? ""
        let teamAway = team.teams[team.matchdetail.teamAway]?.nameShort ?? ""
        let date = DateFormator.getFormatedString(strDate:team.matchdetail.match.date)
        cell.setupData(teamHome,
                       secondTeamName: teamAway,
                       timing:date,
                       stadium: team.matchdetail.venue.name)
        return cell
    }
    
}


///To setup the data in tableview
extension MatchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team =  viewModel.matchesArray[indexPath.row]
        let teamHome = team.teams[team.matchdetail.teamHome]
        let teamAway = team.teams[team.matchdetail.teamAway]
        let vc = MatchDetailsViewController(nibName: Constants.matchDetailsViewController,
                                            bundle: nil)
        vc.viewModel = MatchDetailsViewModel(teamHome: teamHome,
                                             teamAway: teamAway)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

