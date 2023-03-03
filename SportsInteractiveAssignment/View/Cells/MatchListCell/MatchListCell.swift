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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //set's up the view of the cell when nib is initialised
    func setupUI(){
        shadowView.layer.cornerRadius = ThemeConstants.shadowCornerRadius
        shadowView.layer.shadowColor = ThemeConstants.shadowColor
        shadowView.layer.shadowOffset = ThemeConstants.shadowOffset
        shadowView.layer.shadowRadius = ThemeConstants.shadowRadius
        shadowView.layer.shadowOpacity = ThemeConstants.shadowOpacity
    }
    
    //set's up the content of the cell
    func setupData(_ firstTeamName : String?,
                   secondTeamName : String?,
                   timing : String?,
                   stadium : String?) {
        firstTeam.text = firstTeamName
        secondTeam.text = secondTeamName
        matchTiming.text = timing
        venue.text = stadium
    }
    
}
