//
//  CarParts.swift
//  The Abstract Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

enum Cars: String {
    case compact = "VW Golf"
    case sports = "Porsche Boxter"
    case SUV = "Cadillac Escalade"
}

struct Car {
    var carType: Cars
    var floor: Floorplan
    var suspension: Suspension
    var drive: Drivetrain
    
    init(carType: Cars) {
        let factory = CarFactory.getFactory(car: carType)
        self.floor = factory.createFloorplan()
        self.drive = factory.createDrivetrain()
        self.suspension = factory.createSuspension()
        self.carType = carType
    }
    
    func printDetails() {
        print("Car type: \(carType.rawValue)")
        print("Seats: \(floor.seats)")
        print("Engine: \(floor.enginePosition.rawValue)")
        print("Suspension: \(suspension.suspensionType.rawValue)")
        print("Drive: \(drive.driveType.rawValue)")
    }
}
