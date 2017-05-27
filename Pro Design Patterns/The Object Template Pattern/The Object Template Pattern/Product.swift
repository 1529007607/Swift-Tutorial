//
//  Product.swift
//  The Object Template Pattern
//
//  Created by Andrew Chai on 5/17/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class Product {
    private(set) var name: String
    private(set) var description: String
    private(set) var category: String
    private var stockLevelBackingValue: Int = 0
    private var priceBackingValue: Double = 0
    
    init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        self.name = name
        self.description = description
        self.category = category
        self.price = price
        self.stockLevel = stockLevel
    }
    
    var stockLevel: Int {
        get { return stockLevelBackingValue }
        set { stockLevelBackingValue = max(0, newValue) }
    }
    
    private(set) var price: Double {
        get { return priceBackingValue }
        set { priceBackingValue = max(1, newValue) }
    }
    
    var stockValue: Double {
        get {
            return price * Double(stockLevel)
        }
    }
}
