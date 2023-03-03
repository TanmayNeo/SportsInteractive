//
//  MatchDetailsCell.swift
//  SportsInteractiveAssignment
//
//  Created by Tanmay on 03/03/23.
//

import UIKit

class MatchDetailsCell: UITableViewCell {
    
    @IBOutlet weak var playerName : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupContents(player : [Player]?, index : Int) {
        playerName.text = player?[index].displayName
    }
    
}
