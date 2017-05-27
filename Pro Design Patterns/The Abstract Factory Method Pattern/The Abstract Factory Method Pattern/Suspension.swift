//
//  Suspension.swift
//  The Abstract Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

protocol Suspension {
    var suspensionType: SuspensionOption { get }
    
    static func getInstance() -> Suspension
}

enum SuspensionOption: String {
    case standard = "Standard"
    case sports = "Firm"
    case soft = "Soft"
}

class RoadSuspension: Suspension {
    var suspensionType: SuspensionOption = .standard
    
    private init() {}
    
    static func getInstance() -> Suspension {
        return RoadSuspension()
    }
}

class OffRoadSuspension: Suspension {
    var suspensionType: SuspensionOption = .soft
    
    private init() {}
    
    static func getInstance() -> Suspension {
        return OffRoadSuspension()
    }
}

class RaceSuspension: NSObject, Suspension, NSCopying {
    var suspensionType: SuspensionOption = .sports

    private override init() {}
    
    private static let prototype = RaceSuspension()
    
    static func getInstance() -> Suspension {
        return prototype.copy() as! Suspension
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return RaceSuspension()
    }
}
