//
//  MatchListViewController.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 01/03/23.
//

import UIKit

class MatchListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : MatchListViewModel!
    override func viewDidLoad() {
        viewModel = MatchListViewModel()
        super.viewDidLoad()
        setup()
        callbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getMatchDetails()
    }
    
    func setup (){
        self.title = Constants.matchList
        tableView.register(UINib(nibName: Constants.matchListCell, bundle: nil),
                           forCellReuseIdentifier: Constants.matchListCell)
    }
    
    func callbacks(){
        viewModel.reloadTable = {
            self.tableView.reloadData()
        }
    }

}

extension MatchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matchesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MatchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.matchListCell) as! MatchListCell
        cell.setupData(viewModel: viewModel, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MatchDetailsViewController(nibName: Constants.matchDetailsViewController,
                                            bundle: nil)
        vc.viewModel = MatchDetailsViewModel(teamHome: viewModel.getHomeTeam(index: indexPath.row),
                                             teamAway: viewModel.getAwayTeam(index: indexPath.row))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

