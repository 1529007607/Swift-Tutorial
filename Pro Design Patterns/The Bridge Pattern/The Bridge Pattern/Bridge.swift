//
//  Bridge.swift
//  The Bridge Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class CommunicatorBridge: ClearMessageChannel, SecureMessageChannel, PriorityMessageChannel {
    private var channel: Channel
    
    init(channel: Channel.Channels) {
        self.channel = Channel.getChannel(channelType: channel)
    }
    
    func send(_ message: String) {
        let msg = ClearMessage(message: message)
        send(msg)
    }
    
    func sendEncrypted(_ encryptedText: String) {
        let msg = EncryptedMessage(message: encryptedText)
        send(msg)
    }
    
    func sendPriority(_ message: String) {
        send(PriorityMessage(message: message))
    }
    
    private func send(_ msg: Message) {
        msg.prepareMessage()
        channel.send(msg)
    }
}
