//
//  StoreInitializer.swift
//  Classes
//
//  Created by Peter McIntyre on 2015-02-01.
//  Copyright (c) 2017 School of ICT, Seneca College. All rights reserved.
//

import CoreData

class StoreInitializer {
    
    class func populateInitialData(model: Model) {
        // Add code to populate the data store with initial data
        
        // For each object that you want to create...
        // Initialize an object
        // Set its properties
        // Save changes
        
        // This app will work with the "Example" entity that you can see in the object model
        
        // If you have not yet run the app (in the simulator), 
        // and you want to create your own object model, you can...
        // Comment out (or delete) the 'create data' code below
        // Delete the entity in the object model
        // Edit the Model class, and its fetched results controller (uses of 'Example' class need to change)
        // Comment out, delete, or edit the data access statements in the '...List' and '...Detail' controllers

        // If you have run the app in the simulator,
        // you will have to do the above, AND delete the app from the simulator

        guard let entity = NSEntityDescription.entity(forEntityName: "Example", in: model.context) else {
            fatalError("Can't create entity named Example")
        }
        
        let obj: Example
        if #available(iOS 10.0, *) {
            // Once you switch to iOS 10-only, the API looks nicer. I just put this here for reference.
            obj = Example(context: model.context)
        } else {
            obj = Example(entity: entity, insertInto: model.context)
        }
        obj.attribute1 = "Peter"
        obj.attribute2 = 33

        let obj2 = Example(entity: entity, insertInto: model.context)
        obj2.attribute1 = "Garvan"
        obj2.attribute2 = 29
        
        model.saveChanges()
        
        
        
        let players: [AnyObject]
        if let path = Bundle.main.path(forResource: "stats2016qb", ofType: "plist") {
            players = NSArray(contentsOfFile: path) as? [[String: Any]] as [AnyObject]!
        }
        else {
            // Initialize an empty array
            players = [AnyObject]()
        }
        
        for item in players {
            guard let entity = NSEntityDescription.entity(forEntityName: "Player", in: model.context) else {
                fatalError("Can't create entity named Player")
            }
            
            let player = item as! Dictionary<String, Any>
            let somePlayer = Player(entity: entity, insertInto: model.context)
            somePlayer.attempts = player["Attempts"] as! Int64
            somePlayer.attemptsPerGame = player["AttemptsPerGame"] as! Double
            somePlayer.completions = player["Completions"] as! Int64
            somePlayer.interceptions = player["Interceptions"] as! Int64
            somePlayer.longest = player["Longest"] as! Int64
            somePlayer.percentage = player["Percentage"] as! Double
            somePlayer.player = player["Player"] as? String
            somePlayer.rank = player["Rank"] as! Int64
            somePlayer.rating = player["Rating"] as! Double
            somePlayer.sacks = player["Sacks"] as! Int64
            somePlayer.team = player["Team"] as? String
            somePlayer.touchdowns = player["Touchdowns"] as! Int64
            somePlayer.yards = player["Yards"] as! Int64
            somePlayer.yardsPerCompletion = player["YardsPerCompletion"] as! Double
            somePlayer.yardsPerGame = player["YardsPerGame"] as! Double
            
            print(somePlayer.description)
         }
        
        model.saveChanges()
    }
}
