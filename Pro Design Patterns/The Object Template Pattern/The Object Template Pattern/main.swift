//
//  main.swift
//  The Object Template Pattern
//
//  Created by Andrew Chai on 5/17/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

var products = [
    Product(name: "Kayak", description: "A boat for one person", price: 275, stock: 10),
    Product(name: "Lifejecket", description: "Protective and fashionable", price: 48.95, stock: 14),
    Product(name: "Soccer Ball", description: "FIFA-approved size and weight", price: 19.5, stock: 32)
]

func calculateStokeValue(_ productsArray: [Product]) -> Double {
    return productsArray.reduce(0, { (total, product) -> Double in
        return total + product.stokeValue
    })
}

print("Sales tax for Kayak: $\(products[0].calculateTax(rate: 0.2))")
print("Total value of stock: $\(calculateStokeValue(products))")
products[0].stock = -50
print("Stock Level for Kayak: \(products[0].stock)")
