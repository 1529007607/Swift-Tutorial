//
//  main.swift
//  The Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

let passengers = [1, 3, 5]

for p in passengers {
    let car = CarSelector.select(car: p) ?? ""
    print("\(p) passengers: \(car)")
}

