//
//  TreasureMap.swift
//  The Facade Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class TreasureMap {
    enum Treasures {
        case galleon
        case buriedGold
        case sunkenJewels
    }
    
    struct MapLocation {
        let gridLetter: Character
        let gridNumber: UInt
    }
    
    func findTreasure(_ type: Treasures) -> MapLocation {
        switch type {
        case .galleon:
            return MapLocation(gridLetter: Character("D"), gridNumber: 6)
        case .buriedGold:
            return MapLocation(gridLetter: Character("C"), gridNumber: 2)
        case .sunkenJewels:
            return MapLocation(gridLetter: Character("F"), gridNumber: 12)
        }
    }
}
