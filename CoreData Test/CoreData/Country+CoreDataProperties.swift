//
//  Country+CoreDataProperties.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 18.12.2022.
//
//

import Foundation
import CoreData

public class Country: NSManagedObject {
    
    @NSManaged public var name: String?
    @NSManaged public var continent: Continent?
    @NSManaged public var cities: NSSet?
    
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }
    
    
    @objc(addCitiesObject:)
    @NSManaged public func addToCities(_ value: City)
    
    @objc(removeCitiesObject:)
    @NSManaged public func removeFromCities(_ value: City)
    
    @objc(addCities:)
    @NSManaged public func addToCities(_ values: NSSet)
    
    @objc(removeCities:)
    @NSManaged public func removeFromCities(_ values: NSSet)
    
}
