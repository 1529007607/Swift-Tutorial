//
//  Book.swift
//  The Object Pool Pattern
//
//  Created by Andrew Chai on 5/20/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class Book: PoolItem {
    let author: String
    let title: String
    let stockNumber: Int
    var reader: String?
    var checkoutCount = 0
    
    init(author: String, title: String, stock: Int) {
        self.author = author
        self.title = title
        self.stockNumber = stock
    }
    
    var canReuse: Bool {
        get {
            let reusable = checkoutCount < 5
            if !reusable {
                print("Eject: Book#\(self.stockNumber)")
            }
            return reusable
        }
    }
}
