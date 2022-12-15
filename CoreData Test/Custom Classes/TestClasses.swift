//
//  TestClasses.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 15.12.2022.
//

import Foundation
var continents: [Continent] = []
var countries: [Country] = []
var cities: [City] = []

//MARK: - Continent
class Continent {
    
    var continent: String
    var country: Country?
    var city: City?

    init(name continent: String) {
        self.continent = continent
    }
}

//MARK: - Country
class Country {
    
    var continent: Continent
    var country: String
    var city: City?
    
    init(continent: Continent, country: String) {
        self.continent = continent
        self.country = country
    }
}

//MARK: - City
class City {
    
    var continent: Continent
    var country: Country
    var city: String
    
    init(continent: Continent, country: Country, city: String) {
        self.continent = continent
        self.country = country
        self.city = city
    }
}
