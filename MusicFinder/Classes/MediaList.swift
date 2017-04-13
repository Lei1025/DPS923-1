//
//  MediaList.swift
//  MusicFinder
//
//  Created by Bakytzhan Apetov on 2017-03-13.
//  Copyright © 2017 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class MediaList: UITableViewController, WebServiceModelDelegate {

    var model: WebServiceModel!
   // var searchWords: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Results"
        tableView.rowHeight = 70.0
        model.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func webServiceModelDidChangeContent(model: WebServiceModel) {
        tableView.reloadData()
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
        return model.media.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = model.media[indexPath.row]["artistName"] as? String
        cell.detailTextLabel?.text = model.media[indexPath.row]["wrapperType"] as? String
        
        cell.imageView?.image = UIImage(named: "mediaPlaceholder")
        
        if let artworkUrl = model.media[indexPath.row]["artworkUrl60"] {
            
            let url = URL(string: artworkUrl as! String)
            
            let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
            let request = NSURLRequest(url: url!)
            let task: URLSessionDataTask = session.dataTask(with: request as URLRequest, completionHandler: {
                (data, response, error) in
                
                if let data = data {
                    let image = UIImage(data: data)
                    cell.imageView!.image = image
                    cell.setNeedsLayout()
                }
            })
            
            task.resume()
        }

        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toMediaDetail" {
            
            let vc = segue.destination as! MediaDetail
            
            if let row = tableView.indexPathForSelectedRow?.row {
            
                let item = model.media[row]

                vc.detailItem = item
                var titleName = item["wrapperType"] as? String
                titleName = titleName?.capitalized
                vc.title = titleName
            }
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
