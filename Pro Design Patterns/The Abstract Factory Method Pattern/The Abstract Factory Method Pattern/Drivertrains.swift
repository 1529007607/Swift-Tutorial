//
//  Drivertrains.swift
//  The Abstract Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

protocol Drivetrain {
    var driveType: DriveOption { get }
}

enum DriveOption: String {
    case front = "Front"
    case rear = "Rear"
    case all = "4WD"
}

class FrontWheelDrive: Drivetrain {
    var driveType: DriveOption = .front
}

class RearWheelDrive: Drivetrain {
    var driveType: DriveOption = .rear
}

class AllWheelDrive: Drivetrain {
    var driveType: DriveOption = .all
}
