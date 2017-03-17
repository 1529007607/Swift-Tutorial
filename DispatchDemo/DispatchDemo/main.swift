//
//  main.swift
//  DispatchDemo
//
//  Created by Andrew Chai on 3/10/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

var dog = Dog(name: "white", age: 3, mood: .happy)
print(dog.hungerDegree)
dog.eat(5)
print(dog.hungerDegree)

for _ in 0..<10 {
    dog.eat(5)
    print(dog.hungerDegree)
}
