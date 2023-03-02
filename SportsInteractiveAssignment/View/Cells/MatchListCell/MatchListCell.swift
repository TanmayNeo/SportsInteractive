//
//  MatchListCell.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 01/03/23.
//

import UIKit

class MatchListCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var matchTiming: UILabel!
    @IBOutlet weak var firstTeam: UILabel!
    @IBOutlet weak var secondTeam: UILabel!
    @IBOutlet weak var venue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(){
        shadowView.layer.cornerRadius = 5
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 3
        shadowView.layer.shadowOpacity = 0.3
    }
    
    func setupData(viewModel : MatchListViewModel, index: Int) {
        firstTeam.text = viewModel.getHomeTeamShortName(index: index)
        secondTeam.text = viewModel.getAwayTeamShortName(index: index)
        matchTiming.text = viewModel.getTimings(index: index)
        venue.text = viewModel.getVenue(index: index)?.name
    }
    
}
