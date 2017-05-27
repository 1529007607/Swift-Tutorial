//
//  CarFactory.swift
//  The Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class CarFactory {
    static func create(rentalCar passengers: Int) -> RentalCar? {
        var car: RentalCar?
        switch passengers {
        case 0...1:
            car = Sports()
        case 2...3:
            car = Compact()
        case 4...8:
            car = SUV()
        case 9...14:
            car = Minivan()
        default:
            car = nil
        }
        return car
    }
}
