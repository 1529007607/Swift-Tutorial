//
//  main.swift
//  The Facade Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

let map = TreasureMap()
let ship = PirateShip()
let crew = PirateCrew()

let treasureLocation = map.findTreasure(.galleon)

// convert from map to ship coordinates
let sequence: [Character] = ["A", "B", "C", "D", "E", "F", "G"]

var eastWestPos: Character = "A"

for a in sequence {
    if a == treasureLocation.gridLetter {
        print("ok")
        eastWestPos = a
    }
}
let str = String(eastWestPos)
for element in str.unicodeScalars {
    let eastWest: Int = Int(element.value)
    let shipTarget = PirateShip.ShipLocation(northSouth: Int(treasureLocation.gridNumber), eastWest: eastWest)
    
    // relocate ship
    ship.moveToLocation(shipTarget) { (location) in
        // get the crew to work
        crew.performAction(PirateCrew.Actions.attackShip, callback: { (prize) in
            print("Prize: \(prize) pieces of eight")
        })
    }
}

_ = FileHandle.standardInput.availableData


