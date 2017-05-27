//
//  Repository.swift
//  The ModelViewController Pattern
//
//  Created by Andrew Chai on 5/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

protocol Repository {
    var people: [Person] { get }
    
    func addPerson(_ person: Person)
    func removePerson(_ name: String)
    func updatePerson(_ name: String, _ newCity: String)
}

class MemoryRepository: Repository {
    private var peopleArray: [Person]
    
    init() {
        peopleArray = [
            Person("Bob", "New York"),
            Person("Alice", "London"),
            Person("Joe", "Paris")
        ]
    }
    
    var people: [Person] {
        return peopleArray
    }
    
    func addPerson(_ person: Person) {
        peopleArray.append(person)
    }
    
    func removePerson(_ name: String) {
        let nameLower = name.lowercased()
        peopleArray = peopleArray.filter{ $0.name.lowercased() != nameLower }
    }
    
    func updatePerson(_ name: String, _ newCity: String) {
        let nameLower = name.lowercased()
        let test: (Person) -> Bool = { p in return p.name.lowercased() == nameLower }
        if let person = peopleArray.first(where: test) {
            person.city = newCity
        }
    }
}










