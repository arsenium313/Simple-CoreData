//
//  TestClasses.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 15.12.2022.
//

import Foundation
var continentsTestArray: [ContinentTetsClass] = []
var countriesTestArray: [CountryTestClass] = []
var citiesTestArray: [CityTestClass] = []

//MARK: - Continent
class ContinentTetsClass {
    
    var continent: String
    var country: CountryTestClass?
    var city: CityTestClass?

    init(name continent: String) {
        self.continent = continent
    }
}

//MARK: - Country
class CountryTestClass {
    
    var continent: ContinentTetsClass
    var country: String
    var city: CityTestClass?
    
    init(continent: ContinentTetsClass, country: String) {
        self.continent = continent
        self.country = country
    }
}

//MARK: - City
class CityTestClass {
    
    var continent: ContinentTetsClass
    var country: CountryTestClass
    var city: String
    
    init(continent: ContinentTetsClass, country: CountryTestClass, city: String) {
        self.continent = continent
        self.country = country
        self.city = city
    }
}
