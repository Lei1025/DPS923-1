//
//  PlayerDetail.swift
//  QBStats
//
//  Created by Bakytzhan Apetov on 2017-02-11.
//  Copyright © 2017 Bakytzhan Apetov. All rights reserved.
//

import UIKit

class PlayerDetail: UIViewController {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPhoto: UIImageView!
    @IBOutlet weak var teamRatingRank: UILabel!
    @IBOutlet weak var completions: UILabel!
    @IBOutlet weak var yardsLabel: UILabel!
    @IBOutlet weak var tdINTsacks: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    
    var player: Dictionary<String, AnyObject> = [:]
    var model: Model! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = player["Player"] as! String
        let team = player["Team"] as! String
        let rating = player["Rating"] as! Double
        let rank = player["Rank"] as! Int
        let compl = player["Completions"] as! Int
        let attempts = player["Attempts"] as! Int
        let prcnt = player["Percentage"] as! Double
        let yards = player["Yards"] as! Int
        let ypg = player["YardsPerGame"] as! Double
        let ypc = player["YardsPerCompletion"] as! Double
        let td = player["Touchdowns"] as! Int
        let intrcp = player["Interceptions"] as! Int
        let sacks = player["Sacks"] as! Int
        
        let label1 = "Team: \(team), Rating: " +  String(format: "%.1f", rating) + ", NFL Rank: \(rank)"
        let label2 = "Completions: \(compl) / \(attempts), " + String(format: "%.1f", prcnt) + "%"
        let label3 = "Yards: \(yards), " + String(format: "%.1f", ypg) + "/game, " + String(format: "%.1f", ypc) + "/compl."
        let label4 = "\(td) TD, \(intrcp) INT, \(sacks) sacks"

        playerName.text = name
        playerPhoto.image = model.getImage(named: name)
        teamLogo.image = model.getImage(named: team)
        teamRatingRank.text = label1
        completions.text = label2
        yardsLabel.text = label3
        tdINTsacks.text = label4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
