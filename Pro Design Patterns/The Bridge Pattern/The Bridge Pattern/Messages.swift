//
//  Messages.swift
//  The Bridge Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

protocol Message {
    init(message: String)
    func prepareMessage()
    var contentToSend: String { get }
}

class ClearMessage: Message {
    private var message: String
    
    required init(message: String) {
        self.message = message
    }
    
    func prepareMessage() {
        // no action required
    }
    
    var contentToSend: String {
        return message
    }
}

class EncryptedMessage: Message {
    private var clearText: String
    private var cipherText: String?
    
    required init(message: String) {
        self.clearText = message
    }
    
    func prepareMessage() {
        cipherText = String(clearText.characters.reversed())
    }
    
    var contentToSend: String {
        return cipherText!
    }
}
