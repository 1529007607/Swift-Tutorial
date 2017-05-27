//
//  PirateCrew.swift
//  The Facade Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class PirateCrew {
    let workQueue = DispatchQueue(label: "crewWorkQ", qos: .utility, attributes: .initiallyInactive, autoreleaseFrequency: .workItem)
    
    enum Actions {
        case attackShip
        case digForGold
        case diveForJewels
    }
    
    func performAction(_ action: Actions, callback: @escaping (Int) -> Swift.Void) {
        workQueue.async {
            var prizeValue = 0
            switch action {
            case .attackShip:
                prizeValue = 10000
            case .digForGold:
                prizeValue = 5000
            case .diveForJewels:
                prizeValue = 1000
            }
            callback(prizeValue)
        }
    }
}
