//
//  Abstract.swift
//  The Abstract Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class CarFactory {
    required init() {
        // do nothing
    }
    
    func createFloorplan() -> Floorplan {
        fatalError("Not implemented")
    }
    
    func createSuspension() -> Suspension {
        fatalError("Not implemented")
    }
    
    func createDrivetrain() -> Drivetrain {
        fatalError("Not implemented")
    }
    
    class func getFactory(car: Cars) -> CarFactory {
        var factoryType: CarFactory.Type
        switch car {
        case .compact:
            factoryType = CompactCarFactory.self
        case .sports:
            factoryType = SportsCarFactory.self
        case .SUV:
            factoryType = SUVCarFactory.self
        }
        var factory = factoryType.shared
        if factory == nil {
            factory = factoryType.init()
        }
        return factory!
    }
    
    class var shared: CarFactory? {
        get {
            return nil
        }
    }
}
