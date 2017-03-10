//
//  Foundation+Extension.swift
//  CarlBank
//
//  Created by Andrew Chai on 3/7/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

extension Float {
    var dollarFormatting: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension String {
    var accountNumberFormatting: String {
        var formattedString = ""
        for (index, character) in characters.enumerated() {
            if index % 4 < 3 || index == characters.count - 1 {
                formattedString.append(character)
            } else {
                formattedString.append("\(character) ")
            }
        }
        return formattedString
    }
}

extension Date {
    var transactionFormtting: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
}
