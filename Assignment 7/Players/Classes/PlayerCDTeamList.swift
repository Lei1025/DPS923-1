//
//  PlayerCDTeamList.swift
//  Players
//
//  Created by Bakytzhan Apetov on 2017-03-22.
//  Copyright © 2017 School of ICT, Seneca College. All rights reserved.
//

import UIKit
import CoreData

class PlayerCDTeamList: UITableViewController {
    
    var model: Model!
    var players = [Player]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "C&D Team QBs"
        tableView.rowHeight = 70
        
        let fr: NSFetchRequest<Player> = Player.fetchRequest()
        fr.predicate = NSPredicate(format: "team beginswith[cd] 'c'")
        fr.sortDescriptors?.append(NSSortDescriptor(key: "team", ascending: true))
        
        players = model.execute(fetchRequest: fr as! NSFetchRequest<NSFetchRequestResult>) as! [Player]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        self.configure(cell: cell, atIndexPath: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) {        
        let player = players[indexPath.row]
        let teamName = player.team
        let playerName = player.player
        let rating = player.rating
        
        cell.imageView!.image = UIImage(named: playerName!)
        cell.textLabel!.text = playerName
        cell.detailTextLabel!.text = "Team: \(teamName) - Rating: \(rating)"
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
