//
//  main.swift
//  The Proxy Pattern 01
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

let queue = DispatchQueue(label: "requestQ", qos: .utility, attributes: .initiallyInactive, autoreleaseFrequency: .workItem)

for count in 0..<3 {
    let connection = NetworkConnectionFactory.createNetworkConnection()
    
    queue.async {
        connection.connect()
        connection.sendCommand(command: "Command: \(count)")
        connection.disconnect()
    }
}

_ = FileHandle.standardInput.availableData
