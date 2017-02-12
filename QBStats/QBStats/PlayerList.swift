//
//  PlayerList.swift
//  QBStats
//
//  Created by Bakytzhan Apetov on 2017-02-11.
//  Copyright © 2017 Bakytzhan Apetov. All rights reserved.
//

import UIKit

class PlayerList: UITableViewController {

    var model: Model! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return model.players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Extracting the dictionary for the current row
        var player = model.players[indexPath.row] as! Dictionary<String, AnyObject>
        
        
        // Extracting the player's name
        let playerName = player["Player"] as! String
        
        // Setting the table view cell text
        cell.textLabel?.text = playerName
        
        // Setting the table view cell icon
        let teamName = player["Team"] as! String
        cell.imageView?.image = UIImage(named: teamName)

        return cell
    }
 
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toPlayerDetail" {
            
            // Getting a reference to the destination view controller
            let vc = segue.destination as! PlayerDetail
            vc.model = model
            
            // From the data source (which is the array of players in the model object),
            // getting a reference to the object for the tapped table view row
            
            // First, getting the row number
            let tableViewRowNumber = tableView.indexPathForSelectedRow?.row
            
            // Then, attempting to get the object from the data source
            let player = model.players[tableViewRowNumber!] as! Dictionary<String, AnyObject>
        
            // Passing on the object
            vc.player = player
            
        }
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

}
