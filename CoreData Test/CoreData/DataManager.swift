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
    
    func continent(name: String) -> Continent {
        let continent = Continent(context: persistentContainer.viewContext)
        continent.name = name
        return continent
    }
    
    func country(name: String) -> Country {
        let country = Country(context: persistentContainer.viewContext)
        country.name = name
        return country
    }
    
    func city(name: String) -> City {
        let city = City(context: persistentContainer.viewContext)
        city.name = name
        return city
    }
    
}
