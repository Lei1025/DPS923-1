//
//  Model.swift
//  QBStats
//
//  Created by Bakytzhan Apetov on 2017-02-11.
//  Copyright © 2017 Bakytzhan Apetov. All rights reserved.
//
import UIKit
import Foundation

class Model {
    
    // Player data Collection
    var players: [AnyObject]!
    
    // Class initializer
    init() {
        
        // Attempt to locate and read the plist file
        if let path = Bundle.main.path(forResource: "stats2016qb", ofType: "plist") {
            
            players = NSArray(contentsOfFile: path) as? [[String: Any]] as [AnyObject]!
        }
        else {
            
            // Initialize an empty array
            players = [AnyObject]()
        }
    }
    
    // Getting image
    func getImage(named: String) -> UIImage? {
        return UIImage(named: named)
    }
    

}
