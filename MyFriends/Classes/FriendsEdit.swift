//
//  FriendsEdit.swift
//  MyFriends
//
//  Created by Bakytzhan Apetov on 2017-03-28.
//  Copyright © 2017 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class FriendsEdit: UIViewController {

    var delegate: EditItemDelegate?
    var model: Model!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPerson(_ sender: UIButton) {
        
        let newFriend = model.addNewFriend()
        newFriend.firstName = firstName.text
        newFriend.lastName = lastName.text
        
        delegate?.editItem(controller: self, didEditItem: newFriend)
        
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        delegate?.editItem(controller: self, didEditItem: nil)
    }

}

protocol EditItemDelegate {
    
    func editItem(controller: UIViewController, didEditItem item: AnyObject?)
}
