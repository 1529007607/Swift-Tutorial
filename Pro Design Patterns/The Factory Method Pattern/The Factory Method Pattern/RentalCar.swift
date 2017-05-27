//
//  RentalCar.swift
//  The Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

protocol RentalCar {
    var name: String { get }
    var passengers: Int { get }
    var pricePerDay: Float { get }
}

class Compact: RentalCar {
    var name: String = "VM Golf"
    var passengers: Int = 3
    var pricePerDay: Float = 20
}

class Sports: RentalCar {
    var name: String = "Porche Boxter"
    var passengers: Int = 1
    var pricePerDay: Float = 100
}

class SUV: RentalCar {
    var name: String = "Cadillac Escalade"
    var passengers: Int = 8
    var pricePerDay: Float = 75
}

class Minivan: RentalCar {
    var name: String = "Chevrolet Express"
    var passengers: Int = 14
    var pricePerDay: Float = 40
}
