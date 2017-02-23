//
//  File.swift
//  DogsCats
//
//  Created by Andrew Chai on 2/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

enum PetVariety: Int {
    case dog
    case cat
    
    static let allValues: [PetVariety] = [.dog, .cat]
}

enum PetCharacter: String {
    case cowardly
    case mild
    case irritable
}

enum PetTemperament: String {
    case excity
    case happy
    case normal
    case angry
    case fury
}

extension Pet {
    var data: [String: Any] {
        
        return ["attack": attack,
                "defense": defense,
                "intimacy": intimacy,
                "blood": blood,
                "magic": magic,
                "name": name,
                "variety": variety.rawValue]
    }
}

class Pet {
    
    var attack: Int = 0
    var defense: Int = 0
    var intimacy: Int = 0
    var blood: Int = 0
    var magic: Int = 0
    
    var name: String = "None"
    
    var variety: PetVariety = .dog
    
}
