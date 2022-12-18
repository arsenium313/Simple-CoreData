//
//  City+CoreDataProperties.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 18.12.2022.
//
//

import Foundation
import CoreData

public class City: NSManagedObject, Identifiable{

    @NSManaged public var name: String?
    @NSManaged public var continent: Continent?
    @NSManaged public var country: Country?
    
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }
    
}


