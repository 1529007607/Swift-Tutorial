//
//  CarSelector.swift
//  The Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class CarSelector {
    static func select(car passengers: Int) -> String? {
        return CarFactory.create(rentalCar: passengers)?.name
    }
}
