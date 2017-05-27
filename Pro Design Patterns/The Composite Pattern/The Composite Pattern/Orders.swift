//
//  Orders.swift
//  The Composite Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class CustomOrder {
    let customer: String
    let parts: [CarPart]
    
    init(customer: String, parts: [CarPart]) {
        self.customer = customer
        self.parts = parts
    }
    
    var totalPrice: Float {
        return parts.reduce(0, { $0 + $1.price })
    }
    
    func printDetails() {
        print("Order for \(customer): Cost: \(formatCurrencyString(totalPrice))")
    }
    
    func formatCurrencyString(_ number: Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}
