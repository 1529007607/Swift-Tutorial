//
//  main.swift
//  The Flyweight Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

let ss1 = Spreadsheet()
ss1.setValue(Coordinate(col: "A", row: 1), value: 100)
ss1.setValue(Coordinate(col: "J", row: 20), value: 200)
print("SS1 Total: \(ss1.total)")

let ss2 = Spreadsheet()
ss2.setValue(Coordinate(col: "F", row: 10), value: 200)
ss2.setValue(Coordinate(col: "G", row: 23), value: 250)
print("SS2 Total: \(ss2.total)")

print("Cells created: \(ss1.grid.count + ss2.grid.count)")

