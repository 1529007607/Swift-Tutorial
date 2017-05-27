//
//  Options.swift
//  The Decorator Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class GiftOptionDecorator: Purchase {
    private let wrappedPurchase: Purchase
    private let options: [Option]
    
    enum Option {
        case giftWrap
        case ribbon
        case delivery
    }
    
    init(purchase: Purchase, options: Option...) {
        self.wrappedPurchase = purchase
        self.options = options
        super.init(product: purchase.description, price: purchase.totalPrice)
    }
    
    override var description: String {
        var result = wrappedPurchase.description
        for option in options {
            switch option {
            case .giftWrap:
                result = "\(result) + giftWarp"
            case .ribbon:
                result = "\(result) + ribbon"
            case .delivery:
                result = "\(result) + delivery"
            }
        }
        return result
    }
    
    override var totalPrice: Float {
        var result = wrappedPurchase.totalPrice
        for option in options {
            switch option {
            case .giftWrap:
                result += 2
            case .ribbon:
                result += 1
            case .delivery:
                result += 5
            }
        }
        return result
    }
}

