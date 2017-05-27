//
//  Views.swift
//  The ModelViewController Pattern
//
//  Created by Andrew Chai on 5/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

protocol View {
    func execute()
}

class PersonListView: View {
    private let people: [Person]
    
    init(data: [Person]) {
        self.people = data
    }
    
    func execute() {
        for person in people {
            print(person)
        }
    }
}

class CityListView: View {
    private let cities: [String]
    
    init(data: [String]) {
        self.cities = data
    }
    
    func execute() {
        for city in cities {
            print("City: \(city)")
        }
    }
}
