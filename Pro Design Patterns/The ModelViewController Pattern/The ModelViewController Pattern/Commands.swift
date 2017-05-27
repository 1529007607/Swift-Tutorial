//
//  Commands.swift
//  The ModelViewController Pattern
//
//  Created by Andrew Chai on 5/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

enum Command: String {
    case listPeople = "L: List People"
    case addPerson = "A: Add Person"
    case deletePerson = "D: Delete Person"
    case updatePerson = "U: Update Person"
    case search = "S: Search"
    case listCities = "LC: List Cities"
    case searchCities = "SC: Searce Cities"
    case deleteCity = "DC: Delete City"
    
    static let all: [Command] = [.listPeople, .addPerson, .deletePerson, .updatePerson, .search, .listCities, .searchCities, .deleteCity]
    
    static func getFromInput(_ input: String) -> Command? {
        switch input.lowercased() {
        case "l":
            return .listPeople
        case "a":
            return .addPerson
        case "d":
            return .deletePerson
        case "u":
            return .updatePerson
        case "s":
            return .search
        case "lc":
            return .listCities
        case "sc":
            return .searchCities
        case "dc":
            return .deleteCity
        default:
            return nil
        }
    }
}













