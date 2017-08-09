//
//  DatabaseController.swift
//  WatchList
//
//  Created by Steven Patterson on 2/6/17.
//  Copyright © 2017 Steven Patterson. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {

    static var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "WatchList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    static var context: NSManagedObjectContext {return persistentContainer.viewContext}
    
    
}
