//
//  main.swift
//  The Chain of Responsibility Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

let messages = [
    Message(from: "bob@example.com", to: "joe@example.com", subject: "Free for lunch?"),
    Message(from: "joe@example.com", to: "alice@acme.com",
        subject: "New Contracts"),
    Message(from: "pete@example.com", to: "all@example.com",
        subject: "Priority: All-Hands Meeting"),
]

if let chain = Transmitter.createChain(localOnly: true) {
    for msg in messages {
        let handled = chain.sendMessage(msg)
        print("Message sent: \(handled)")
    }
}












