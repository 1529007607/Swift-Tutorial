//
//  Library.swift
//  The Object Pool Pattern
//
//  Created by Andrew Chai on 5/20/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

final class Library {
    private let pool: Pool<Book>
    
    private init(stockLevel: Int) {
        var stockId = 1
        defer {
            stockId += 1
        }
        pool = Pool<Book>(maxItemCount: stockLevel, factory: { () -> Book in
            return BookSeller.buyBook(author: "Dickens, Charles", title: "Hard Times", stockNumber: stockId)
        })
    }
    
    private static let shared = Library(stockLevel: 200)
    
    static func checkoutBook(reader: String) -> Book? {
        let book = shared.pool.get()
        book?.reader = reader
        book?.checkoutCount += 1
        return book
    }
    
    static func backBook(book: Book) {
        book.reader = nil
        shared.pool.back(toPool: book)
    }
    
    static func printReport() {
        shared.pool.processPoolItems { (books) in
            for book in books {
                print("...Book#\(book.stockNumber)...")
                print("Checked out \(book.checkoutCount) times")
                book.reader != nil ? print("Checked out to \(book.reader!)") : print("In stock")
            }
        }
    }
}
