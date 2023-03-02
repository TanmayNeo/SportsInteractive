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
        // Do any additional setup after loading the view.
    }


    func setupUI() {
        name.text = player?.displayName
        bowlingStyle.text = "Bowling Style : \(player?.bowling.style ?? "")"
        bowlingAvg.text = "Bowling Average : \(player?.bowling.average ?? "")"
        bowlingEconomy.text = "Bowling Economy : \(player?.bowling.economyrate ?? "")"
        wickets.text = "Wickets : \(player?.bowling.wickets ?? "")"
        
        battingStyle.text = "Batting Style : \(player?.batting.style.rawValue ?? "")"
        battingAvg.text = "batting Average : \(player?.batting.average ?? "")"
        battingStrikerate.text = "Batting Strike Rate : \(player?.batting.strikerate ?? "")"
        runs.text = "Runs : \(player?.batting.runs ?? "")"
    }

}
