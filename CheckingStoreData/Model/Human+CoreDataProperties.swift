//
//  Human+CoreDataProperties.swift
//  CheckingStoreData
//
//  Created by мак on 09.03.2020.
//  Copyright © 2020 viktorsafonov. All rights reserved.
//
//

import Foundation
import CoreData


extension Human {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Human> {
        return NSFetchRequest<Human>(entityName: "Human")
    }

    @NSManaged public var name: String
    @NSManaged public var age: String?
    @NSManaged public var gender: String?

}
