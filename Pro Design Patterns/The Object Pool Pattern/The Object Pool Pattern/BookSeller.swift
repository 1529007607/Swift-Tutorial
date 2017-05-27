//
//  BookSeller.swift
//  The Object Pool Pattern
//
//  Created by Andrew Chai on 5/20/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class BookSeller {
    static func buyBook(author: String, title: String, stockNumber: Int) -> Book {
        return Book(author: author, title: title, stock: stockNumber)
    }
}

class LibraryNetwork {
    static func borrowBook(author: String, title: String, stockNumber: Int) -> Book {
        return Book(author: author, title: title, stock: stockNumber)
    }
    
    static func backBook(book: Book) {
        // do nothing
    }
}
