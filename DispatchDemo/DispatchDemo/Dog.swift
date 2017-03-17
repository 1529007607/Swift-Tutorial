//
//  test.swift
//  DispatchDemo
//
//  Created by Andrew Chai on 3/10/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

public enum DogVarieties {
    case Dot
}

public enum Mood {
    case happy
    case sad
    case angry
    case normal
}

typealias Food = Int

public struct Dog {
    var name: String
    
    var age: Food {
        didSet(newValue) {
            
        }
    }
    
    var mood: Mood
    
    var hungerDegree: Int {
        willSet(newValue) {
            let outOfValue = hungerDegree + newValue - 100
            if outOfValue > 0 {
                self.age -= outOfValue
            } else {
                self.age -= newValue
            }
        }
        
        didSet(newValue) {
            if hungerDegree > 100 {
                hungerDegree = 100
            } else if hungerDegree < 30 {
                self.mood = .sad
            } else if hungerDegree < 0 {
                hungerDegree = 0
            }
        }
    }
    
    init(name: String, age: Int, mood: Mood = .normal, hungerDegree: Int = 50) {
        self.name = name
        self.age = age
        self.mood = mood
        self.hungerDegree = hungerDegree
    }
}

public extension Dog {
    mutating func eat(_ food: Int) {
        self.hungerDegree += food
    }
    
    
}
