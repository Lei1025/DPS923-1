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
        
        let ctx = model.cdStack.managedObjectContext
        
        guard let program = NSEntityDescription.entity(forEntityName: "Program", in: ctx!) else {
            fatalError("Unable to create a Program entity type")
        }
        
        guard let course = NSEntityDescription.entity(forEntityName: "Course", in: ctx!) else {
            fatalError("Unable to create a Course entity type")
        }
        
        // BSD
        
        let bsd = Program(entity: program, insertInto: ctx)
        bsd.code = "BSD"
        bsd.credential = "Degree"
        bsd.fullName = "Honours Bachelor of Technology (Software Development)"
 
        model.saveChanges()
        
        // Courses 
        
        let btp400 = Course(entity: course, insertInto: ctx)
        btp400.code = "BTP400"
        btp400.fullName = "Object-Oriented Software Development - Java"
        btp400.courseDescription = "This course will serve as a thorough introduction to Java as an object-oriented language. Topics studied will include OO concepts in Java, threads, exceptions, GUI programming using AWT/Swing, input/output, networking, client-server programming, applets, and database access via JDBC."
        btp400.program = bsd
        
        let btn415 = Course(entity: course, insertInto: ctx)
        btn415.code = "BTN415"
        btn415.fullName = "Data Communications Programming"
        btn415.courseDescription = "This course provides a technical foundation in data communications and network technology. It introduces the various media used along with the main techniques employed to provide reliable and efficient communications."
        btn415.program = bsd
        
        let bti425 = Course(entity: course, insertInto: ctx)
        bti425.code = "BTI425"
        bti425.fullName = "Web Programming for Apps and Services"
        bti425.courseDescription = "This course specifically addresses the technical skills and business knowledge required to develop data-driven web sites hosted on the Microsoft Web Platform."
        bti425.program = bsd
        
        let bts430 = Course(entity: course, insertInto: ctx)
        bts430.code = "BTS430"
        bts430.fullName = "Systems Analysis and Design using UML"
        bts430.courseDescription = "This course focuses on the practical application of object-oriented concepts for analysis and design to the development of business systems."
        bts430.program = bsd
        
        let btc440 = Course(entity: course, insertInto: ctx)
        btc440.code = "BTC440"
        btc440.fullName = "Business and Technical Writing"
        btc440.courseDescription = "This course focuses on the knowledge and skills required for writing pertinent business correspondence and business or technical proposals and reports, as appropriate to the software development field."
        btc440.program = bsd
        
        model.saveChanges()
        
        // CPA
        
        let cpa = Program(entity: program, insertInto: ctx)
        cpa.code = "CPA"
        cpa.credential = "Diploma"
        cpa.fullName = "Computer Programming and Analysis"
        
        model.saveChanges()
        
        // Courses
        
        let ica002 = Course(entity: course, insertInto: ctx)
        ica002.code = "ICA002"
        ica002.fullName = "Introduction to Computers and Applications"
        ica002.courseDescription = "In ICA002, students are introduced to use of computer systems, MS Access 2010 for databases in place of Concepts, and the following business applications: MS Word 2010 for word processing, MS PowerPoint 2010 for business presentations, and MS Excel 2010 for spreadsheets."
        ica002.program = cpa
        
        let apc100 = Course(entity: course, insertInto: ctx)
        apc100.code = "APC100"
        apc100.fullName = "Applied Professional Communications"
        apc100.courseDescription = "This subject focuses on group work, team building, interpersonal communication, presentation skills, conflict and time management with applications to the computer industry."
        apc100.program = cpa
        
        model.saveChanges()
        
        // CPD
        
        let cpd = Program(entity: program, insertInto: ctx)
        cpd.code = "CPD"
        cpd.credential = "Diploma"
        cpd.fullName = "Computer Programmer"
        
        model.saveChanges()
        
        // IFS
        
        let ifs = Program(entity: program, insertInto: ctx)
        ifs.code = "IFS"
        ifs.credential = "Degree"
        ifs.fullName = "Informatics and Security"
        
        model.saveChanges()
        
        // CTY
        
        let cty = Program(entity: program, insertInto: ctx)
        cty.code = "CTY"
        cty.credential = "Diploma"
        cty.fullName = "Computer Systems Technology"
        
        model.saveChanges()
        
        // CNS
        
        let cns = Program(entity: program, insertInto: ctx)
        cns.code = "CNS"
        cns.credential = "Diploma"
        cns.fullName = "Computer Networking and Technical Support"
        
        model.saveChanges()
        
        // DAD
        
        let dad = Program(entity: program, insertInto: ctx)
        dad.code = "DAD"
        dad.credential = "Certificate"
        dad.fullName = "Database Application Developer"
        
        model.saveChanges()
        
        // PMC
        
        let pmc = Program(entity: program, insertInto: ctx)
        pmc.code = "PMC"
        pmc.credential = "Certificate"
        pmc.fullName = "Project Management (Information Technology)"
        
        model.saveChanges()
    }
}




















