//
//  Utils.swift
//  The Object Template Pattern
//
//  Created by Andrew Chai on 5/17/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class Utils {
    class func currencyString(from value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let number = NSNumber(value: value)
        return formatter.string(from: number) ?? ""
    }
}
