//
//  PirateShip.swift
//  The Facade Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class PirateShip {
    struct ShipLocation {
        let northSouth: Int
        let eastWest: Int
    }
    
    var currentPosition: ShipLocation
    var movementQueue = DispatchQueue(label: "shipQ", qos: .utility, attributes: .initiallyInactive, autoreleaseFrequency: .workItem)
    
    init() {
        currentPosition = ShipLocation(northSouth: 5, eastWest: 5)
    }
    
    func moveToLocation(_ location: ShipLocation, callback: @escaping (ShipLocation) -> Swift.Void) {
        movementQueue.async {
            self.currentPosition = location
            callback(self.currentPosition)
        }
    }
}
