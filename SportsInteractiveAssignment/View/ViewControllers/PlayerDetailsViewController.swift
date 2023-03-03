//
//  PlayerDetailsViewController.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 02/03/23.
//

import UIKit

class PlayerDetailsViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    @IBOutlet weak var bowlingAvg: UILabel!
    @IBOutlet weak var bowlingEconomy: UILabel!
    @IBOutlet weak var wickets: UILabel!
    
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var battingAvg: UILabel!
    @IBOutlet weak var battingStrikerate: UILabel!
    @IBOutlet weak var runs: UILabel!
    
    var player : Player?
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    ///Sets up the view of the player details by taking the details of the player and displayong them for corresponding labels
    func setupUI() {
        name.text = player?.displayName
        bowlingStyle.text = Constants.bowlingStyle + (player?.bowling.style ?? "")
        bowlingAvg.text =  Constants.bowlingAverage + (player?.bowling.average ?? "")
        bowlingEconomy.text = Constants.bowlingEconomy + (player?.bowling.economyrate ?? "")
        wickets.text = Constants.wickets + (player?.bowling.wickets ?? "")
        
        battingStyle.text = Constants.battingStyle + (player?.batting.style.rawValue ?? "")
        battingAvg.text = Constants.battingAverage + (player?.batting.average ?? "")
        battingStrikerate.text = Constants.battingStrikeRate + (player?.batting.strikerate ?? "")
        runs.text = Constants.runs + (player?.batting.runs ?? "")
    }

}
