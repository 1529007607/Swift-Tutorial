//
//  PriceCalculator.swift
//  The Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class PriceCalculator {
    static func calculate(price passengers: Int, days: Int) -> Float? {
        let car = CarFactory.create(rentalCar: passengers)
        if let pricePerDay = car?.pricePerDay {
            return pricePerDay * Float(days)
        }
        
        return nil
    }
}
