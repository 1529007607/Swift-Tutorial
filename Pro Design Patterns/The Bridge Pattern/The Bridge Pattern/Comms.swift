//
//  Comms.swift
//  The Bridge Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

protocol ClearMessageChannel {
    func send(_ message: String)
}

protocol SecureMessageChannel {
    func sendEncrypted(_ encryptedText: String)
}

protocol PriorityMessageChannel {
    func sendPriority(_ message: String)
}

class Communicator {
    private let clearChannel: ClearMessageChannel
    private let secureChannel: SecureMessageChannel
    private let priorityChannel: PriorityMessageChannel
    
    init(clearChannel: ClearMessageChannel, secureChannel: SecureMessageChannel, priorityChannel: PriorityMessageChannel) {
        self.clearChannel = clearChannel
        self.secureChannel = secureChannel
        self.priorityChannel = priorityChannel
    }
    
    func sendCleartext(_ message: String) {
        self.clearChannel.send(message)
    }
    
    func sendSecure(_ message: String) {
        self.secureChannel.sendEncrypted(message)
    }
    
    func sendPriority(_ message: String) {
        self.priorityChannel.sendPriority(message)
    }
}
