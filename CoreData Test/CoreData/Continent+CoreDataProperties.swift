//
//  Continent+CoreDataProperties.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 18.12.2022.
//
//

import Foundation
import CoreData

public class Continent: NSManagedObject {

    @NSManaged public var name: String?
    @NSManaged public var countries: NSSet?
    @NSManaged public var cities: NSSet?
    
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Continent> {
        return NSFetchRequest<Continent>(entityName: "Continent")
    }
    
    
    @objc(addCountriesObject:)
    @NSManaged public func addToCountries(_ value: Country)

    @objc(removeCountriesObject:)
    @NSManaged public func removeFromCountries(_ value: Country)

    @objc(addCountries:)
    @NSManaged public func addToCountries(_ values: NSSet)

    @objc(removeCountries:)
    @NSManaged public func removeFromCountries(_ values: NSSet)
    
    
    @objc(addCitiesObject:)
    @NSManaged public func addToCities(_ value: City)

    @objc(removeCitiesObject:)
    @NSManaged public func removeFromCities(_ value: City)

    @objc(addCities:)
    @NSManaged public func addToCities(_ values: NSSet)

    @objc(removeCities:)
    @NSManaged public func removeFromCities(_ values: NSSet)
}


