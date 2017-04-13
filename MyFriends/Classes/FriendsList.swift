//
//  FriendsList.swift
//  MyFriends
//
//  Created by Bakytzhan Apetov on 2017-03-28.
//  Copyright © 2017 School of ICT, Seneca College. All rights reserved.
//

import UIKit
import CoreData

class FriendsList: UITableViewController, NSFetchedResultsControllerDelegate, EditItemDelegate {
    
    var model: Model!
    var frc: NSFetchedResultsController<Friend>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Friends"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        frc = model.frc_friend
        
        frc.delegate = self
        
        do {
            try frc.performFetch()
        }
        catch let error as NSError {
            print(error.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.frc.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.frc.sections?[section].numberOfObjects ?? 0
    }
    
    @IBAction func onEditButton(_ sender: UIBarButtonItem) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    func doSearch(_ str: String) {
        
        if str.characters.count != 0 {
            frc.fetchRequest.predicate = NSPredicate(format: "(firstName CONTAINS[cd] %@) || (lastName CONTAINS[cd] %@)", str, str)
        }
        else {
            frc.fetchRequest.predicate = nil
        }
        
        do {
            try frc.performFetch()
        }
        catch let error as NSError {
            print(error.description)
        }
        tableView.reloadData()
    }
    
    @IBAction func onSearchButton(_ sender: UIBarButtonItem) {
        
        func presentAlert() {
            let alertController = UIAlertController(title: nil, message: "Search for:", preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: "Search", style: .default) { _ -> Void in
                if let value = alertController.textFields?[0].text {
                    // store your data
                    self.doSearch(value)
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ -> Void in
                print("Was cancelled")
            }
            
            alertController.addTextField(configurationHandler: { (textField) in
                textField.placeholder = "Enter text to search for"
            })
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        presentAlert()
    }
    
    func editItem(controller: UIViewController, didEditItem item: AnyObject?) {
        
        self.model.saveChanges()
        
        // Dismiss the modal 'add item' controller
        controller.dismiss(animated: true, completion: {})
    }

    // Deleting an item
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedItem: Friend = frc.object(at: indexPath)
            model.delete(item: deletedItem)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toFriendsEdit" {
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! FriendsEdit
            
            vc.delegate = self
            vc.model = self.model
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let item: Friend = frc.object(at: indexPath)
        let fn = item.firstName!
        let ln = item.lastName!
        cell.textLabel!.text = "\(ln), \(fn)"

        return cell
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.reloadData()
    }
}
