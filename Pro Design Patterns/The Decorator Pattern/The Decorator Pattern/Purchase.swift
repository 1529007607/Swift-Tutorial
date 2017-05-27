//
//  Purchase.swift
//  The Decorator Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class Purchase {
    fileprivate let product: String
    private let price: Float
    
    init(product: String, price: Float) {
        self.product = product
        self.price = price
    }
    
    var totalPrice: Float {
        return price
    }
    
    var description: String {
        return product
    }
}

extension Purchase: CustomStringConvertible {}
