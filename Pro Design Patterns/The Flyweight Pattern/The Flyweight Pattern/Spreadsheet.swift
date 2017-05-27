//
//  Spreadsheet.swift
//  The Flyweight Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class Coordinate: Hashable, CustomStringConvertible {
    let col: Character
    let row: Int
    
    init(col: Character, row: Int) {
        self.col = col
        self.row = row
    }
    
    var hashValue: Int {
        return description.hashValue
    }
    
    var description: String {
        return "\(col)\(row)"
    }
    
    static func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.col == rhs.col && lhs.row == rhs.row
    }
}


class Cell {
    var coordinate: Coordinate
    var value: Int
    
    init(col: Character, row: Int, val: Int) {
        self.coordinate = Coordinate(col: col, row: row)
        self.value = val
    }
}

class Spreadsheet {
    var grid: Flyweight
    
    init() {
        grid = FlyweightFactory.createFlyweight()
    }
    
    func setValue(_ coord: Coordinate, value: Int) {
        grid[coord] = value
    }
    
    var total: Int {
        return grid.total
    }
}
















