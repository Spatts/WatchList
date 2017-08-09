//
//  SavedMovie+CoreDataProperties.swift
//  WatchList
//
//  Created by Steven Patterson on 2/6/17.
//  Copyright © 2017 Steven Patterson. All rights reserved.
//

import Foundation
import CoreData


extension SavedMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedMovie> {
        return NSFetchRequest<SavedMovie>(entityName: "SavedMovie");
    }

    @NSManaged public var title: String?
    @NSManaged public var overview: String?
    @NSManaged public var rating: Double
    @NSManaged public var poster: NSData?

}
