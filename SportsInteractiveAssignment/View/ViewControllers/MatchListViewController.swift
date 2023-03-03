//
//  MatchListViewController.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 01/03/23.
//

import UIKit

class MatchListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : MatchListViewModel?
    override func viewDidLoad() {
        viewModel = MatchListViewModel()
        super.viewDidLoad()
        setup()
        callbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.getMatchDetails()
    }
    
    ///To set up the navigation title and register XIB cells for the table view
    func setup (){
        self.title = Constants.matchList
        tableView.register(UINib(nibName: Constants.matchListCell, bundle: nil),
                           forCellReuseIdentifier: Constants.matchListCell)
    }
    
    ///To reload the table after the data from the API call has been received
    func callbacks(){
        viewModel?.reloadTable = {
            self.tableView.reloadData()
        }
    }

}

/// To setup the count of cells and height of the table view
extension MatchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.matchesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


///To setup the data in tableview
extension MatchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.matchListCell) as! MatchListCell
        cell.setupData(viewModel?.getHomeTeamShortName(index: indexPath.row),
                       secondTeamName: viewModel?.getAwayTeamShortName(index: indexPath.row),
                       timing: viewModel?.getTimings(index: indexPath.row),
                       stadium: viewModel?.getVenue(index: indexPath.row)?.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MatchDetailsViewController(nibName: Constants.matchDetailsViewController,
                                            bundle: nil)
        vc.viewModel = MatchDetailsViewModel(teamHome: viewModel?.getHomeTeam(index: indexPath.row),
                                             teamAway: viewModel?.getAwayTeam(index: indexPath.row))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

