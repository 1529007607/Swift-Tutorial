//
//  main.swift
//  The Object Pool Pattern
//
//  Created by Andrew Chai on 5/20/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

var queue = DispatchQueue(label: "workQ", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem)
var group = DispatchGroup()

print("Starting...")

for i in 1...20 {
    queue.async(group: group, qos: .utility, flags: .assignCurrentContext, execute: { 
        var book = Library.checkoutBook(reader: "reader#\(i)")
        if book != nil {
            Thread.sleep(forTimeInterval: TimeInterval(arc4random() % 2))
            Library.backBook(book: book!)
        }
    })
}

_ = group.wait(timeout: .distantFuture)

print("All blocks complete")

Library.printReport()
