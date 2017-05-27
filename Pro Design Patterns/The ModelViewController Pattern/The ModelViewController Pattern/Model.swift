//
//  Model.swift
//  The ModelViewController Pattern
//
//  Created by Andrew Chai on 5/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class Person: Equatable, CustomStringConvertible {
    var name: String
    var city: String
    
    init(_ name: String, _ city: String) {
        self.name = name
        self.city = city
    }
    
    var description: String {
        return "Name: \(name), City: \(city)"
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.city == rhs.city
    }
}
















