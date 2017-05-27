//
//  main.swift
//  The Decorator Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

let account = CustomerAccount(name: "Joe")

account.addPurchase(Purchase(product: "Red Hat", price: 10))
account.addPurchase(Purchase(product: "Scarf", price: 20))
account.addPurchase(EndOfLineDecorator(purchase: BlackFridayDecorator(purchase: GiftOptionDecorator(purchase: Purchase(product: "Sunglasses", price: 25), options: .giftWrap, .delivery))))

account.printAccount()

for p in account.purchases {
    if let d = p as? DiscountDecorator {
        print("\(p) has \(d.countDiscounts()) discounts")
    } else {
        print("\(p) has no discounts")
    }
}

