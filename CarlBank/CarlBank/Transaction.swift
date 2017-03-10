//
//  Transaction.swift
//  CarlBank
//
//  Created by Andrew Chai on 3/6/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

enum TransactionCategory: String {
    case income
    case groceries
    case utilities
    case home
    case transport
    case fun
}

extension TransactionCategory {
    struct Appearance {
        let color: UIColor
    }
    
    var appearance: Appearance {
        switch self {
        case .income:
            return Appearance(color: .green)
        case .groceries:
            return Appearance(color: .blue)
        case .utilities:
            return Appearance(color: .brown)
        case .home:
            return Appearance(color: .cyan)
        case .transport:
            return Appearance(color: .magenta)
        case .fun:
            return Appearance(color: .purple)
        }
    }
}

struct Transaction {
    let amount: Float // In a real app that deals with money you should not use floating point numbers!
    let description: String
    let date: Date
    let category: TransactionCategory
}

extension Transaction {
    var plistRepresentation: [String: AnyObject] {
        return [
            "amount": amount as AnyObject,
            "description": description as AnyObject,
            "date": date as AnyObject,
            "category": category.rawValue as AnyObject
        ]
    }
    
    init(plist: [String: AnyObject]) {
        amount = plist["amount"] as! Float
        description = plist["description"] as! String
        date = plist["date"] as! Date
        category = TransactionCategory(rawValue: plist["category"] as! String)!
    }
}
