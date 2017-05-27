//
//  Product.swift
//  SportsStore
//
//  Created by Andrew Chai on 5/17/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class Product {
    var name: String
    var description: String
    var price: Double
    var stock: Int
    
    init(name: String, description: String, price: Double, stock: Int) {
        self.name = name
        self.description = description
        self.price = price
        self.stock = stock
    }
}
