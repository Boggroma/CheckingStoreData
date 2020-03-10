//
//  Human+CoreDataClass.swift
//  CheckingStoreData
//
//  Created by мак on 09.03.2020.
//  Copyright © 2020 viktorsafonov. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Human)
public class Human: NSManagedObject {
    
    class func newHuman (name: String) -> Human {
    let human = Human(context: CoreDataManager.sharedInstance.managedObjectContext)
        human.name = name
        return human
    }
}
