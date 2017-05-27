//
//  Concrete.swift
//  The Abstract Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class CompactCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return StandardFloorplan()
    }
    
    override func createDrivetrain() -> Drivetrain {
        return FrontWheelDrive()
    }
    
    override func createSuspension() -> Suspension {
        return RoadSuspension.getInstance()
    }
}

class SportsCarFactory: CarFactory {
    override func createSuspension() -> Suspension {
        return RoadSuspension.getInstance()
    }
    
    override func createDrivetrain() -> Drivetrain {
        return AllWheelDrive()
    }
    
    override func createFloorplan() -> Floorplan {
        return ShortFloorplan()
    }
    
    override static var shared: CarFactory? {
        get {
            struct SingletonWrapper {
                static let singleton = SportsCarFactory()
            }
            return SingletonWrapper.singleton
        }
    }
}

class SUVCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return LongFloorplan()
    }
    
    override func createDrivetrain() -> Drivetrain {
        return AllWheelDrive()
    }
    
    override func createSuspension() -> Suspension {
        return OffRoadSuspension.getInstance()
    }
}
