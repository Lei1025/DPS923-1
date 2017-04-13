//
//  PlayerTop5List.swift
//  Players
//
//  Created by Bakytzhan Apetov on 2017-03-22.
//  Copyright © 2017 School of ICT, Seneca College. All rights reserved.
//

import UIKit
import CoreData

class PlayerTop5List: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var model: Model!
    var frc: NSFetchedResultsController<Player>!
    var count: Int!
    var results: AnyObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Top 5 Rated"
        tableView.rowHeight = 70
        //model.delegate = self

        let fr: NSFetchRequest<Player> = Player.fetchRequest()
        fr.fetchLimit = 5
        fr.sortDescriptors?.append(NSSortDescriptor(key: "rating", ascending: true))
    
        // Pass the fetch request to the model for execution
        results = model.execute(fetchRequest: fr as! NSFetchRequest<NSFetchRequestResult>) as AnyObject
        
        count = results.count
        // Handle the results
        print("Results count is \(results.count)")
        
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
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        self.configure(cell: cell, atIndexPath: indexPath)
        return cell
    }
 
    func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) {        
        let player = results[indexPath.row] as! Dictionary<String, Any>
        let teamName = player["team"] as! String
        let playerName = player["player"] as! String
        let rating = player["rating"] as! String
        
        cell.imageView!.image = UIImage(named: playerName)
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
