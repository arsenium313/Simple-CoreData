//
//  DataManager.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 18.12.2022.
//

import Foundation
import CoreData

class DataManager{
    
    static let shared = DataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData_Test")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func delete<T>(_ object: T){
        let context = persistentContainer.viewContext
        context.delete(object as! NSManagedObject)
        saveContext()
    }
    
    //MARK: - Create Entity
    func continent(name: String) -> Continent {
        let continent = Continent(context: persistentContainer.viewContext)
        continent.name = name
        return continent
    }
    
    func country(name: String, continent: Continent) -> Country {
        let country = Country(context: persistentContainer.viewContext)
        country.name = name
        continent.addToCountries(country)
        return country
    }
    
    func city(name: String, continent: Continent, country: Country) -> City {
        let city = City(context: persistentContainer.viewContext)
        city.name = name
        continent.addToCities(city)
        country.addToCities(city)
        return city
    }
    
    //MARK: - Fetch
    func fetchContinents() -> [Continent] {
        let request: NSFetchRequest<Continent> = Continent.fetchRequest()
        var continents: [Continent] = []
        
        do {
            try continents = persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("error - \(error)")
        }
        
        return continents
    }
    
    func fetchCountries() -> [Country]{
        let request: NSFetchRequest<Country> = Country.fetchRequest()
        var countries: [Country] = []
        
        do {
            try countries = persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("error - \(error)")
        }
        
        return countries
    }
    
    func fetchCities() -> [City] {
        let request: NSFetchRequest<City> = City.fetchRequest()
        var cities: [City] = []
        
        do {
            try cities = persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("error - \(error)")
        }
        
        return cities
    }
    
    
    
    
    
    
    
    
}
