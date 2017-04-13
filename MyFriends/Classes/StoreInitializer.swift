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

        model.deleteAll()
/*
        guard let entity = NSEntityDescription.entity(forEntityName: "Example", in: model.context) else {
            fatalError("Can't create entity named Example")
        }

        let obj = Example(entity: entity, insertInto: model.context)
        obj.attribute1 = "Peter"
        obj.attribute2 = 33

        let obj2 = Example(entity: entity, insertInto: model.context)
        obj2.attribute1 = "Garvan"
        obj2.attribute2 = 29
        
        model.saveChanges()
        */
        guard let entity = NSEntityDescription.entity(forEntityName: "Friend", in: model.context) else {
            fatalError("Can't create entity named Friend")
        }
        
        let obj = Friend(entity: entity, insertInto: model.context)
        obj.firstName = "Brenda"
        obj.lastName = "Baker"
        
        let obj1 = Friend(entity: entity, insertInto: model.context)
        obj1.firstName = "Brian"
        obj1.lastName = "Douglas"
        
        let obj2 = Friend(entity: entity, insertInto: model.context)
        obj2.firstName = "Hans"
        obj2.lastName = "Heim"
        
        let obj3 = Friend(entity: entity, insertInto: model.context)
        obj3.firstName = "Martin"
        obj3.lastName = "Jones"
        
        let obj4 = Friend(entity: entity, insertInto: model.context)
        obj4.firstName = "Garvan"
        obj4.lastName = "Keeley"
        
        let obj5 = Friend(entity: entity, insertInto: model.context)
        obj5.firstName = "Doug"
        obj5.lastName = "Martin"
        
        let obj6 = Friend(entity: entity, insertInto: model.context)
        obj6.firstName = "Mike"
        obj6.lastName = "Martin"
        
        let obj7 = Friend(entity: entity, insertInto: model.context)
        obj7.firstName = "Peter"
        obj7.lastName = "McIntyre"
        
        let obj8 = Friend(entity: entity, insertInto: model.context)
        obj8.firstName = "Ian"
        obj8.lastName = "Tipson"
        
        model.saveChanges()
        
    }
}
