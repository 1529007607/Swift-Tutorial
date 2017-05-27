//
//  Transmitters.swift
//  The Chain of Responsibility Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class Transmitter {
    var nextLink: Transmitter?
    
    required init() {}
    
    /// Return value indicates whether responsilibility was taken for the request
    /// Second parameter notifies all links in the chain
    func sendMessage(_ msg: Message, handled: Bool = false) -> Bool {
        if let nextLink = nextLink {
            return nextLink.sendMessage(msg, handled: handled)
        } else if !handled {
            print("End of chain reached. Message not sent")
        }
        return handled
    }
    
    /// Applying the Factory Method Pattern
    class func createChain(localOnly: Bool) -> Transmitter? {
        let transmitterClasses: [Transmitter.Type] = localOnly ?
            [PriorityTransmitter.self,
             LocalTransmitter.self,
            ] :
            [PriorityTransmitter.self,
             LocalTransmitter.self,
             RemoteTransmitter.self
        ]
        
        var link: Transmitter?
        
        for tClass in transmitterClasses.reversed() {
            let existingLink = link
            link = tClass.init()
            link?.nextLink = existingLink
        }
        
        return link
    }
    
    fileprivate class func matchEmailSuffix(_ msg: Message) -> Bool {
        if let index = msg.from.characters.index(of: "@") {
            return msg.to.hasSuffix(String(msg.from.characters.suffix(from: index)))
        }
        return false
    }
}

class LocalTransmitter: Transmitter {
    override func sendMessage(_ msg: Message, handled: Bool) -> Bool {
        var handled = handled
        if !handled && Transmitter.matchEmailSuffix(msg) {
            print("Message to \(msg.to) sent locally")
            handled = true
        }
        return super.sendMessage(msg, handled: handled)
    }
}

class RemoteTransmitter: Transmitter {
    override func sendMessage(_ msg: Message, handled: Bool) -> Bool {
        var handled = handled
        if !handled && !Transmitter.matchEmailSuffix(msg) {
            print("Message to \(msg.to) sent remotely")
            handled = true
        }
        return super.sendMessage(msg, handled: handled)
    }
}

class PriorityTransmitter: Transmitter {
    var totalMessages = 0
    var handledMessages = 0
    
    override func sendMessage(_ msg: Message, handled: Bool) -> Bool {
        totalMessages += 1
        var handled = handled
        if !handled && msg.subject.hasPrefix("Priority") {
            handledMessages += 1
            print("Message to \(msg.to) sent as priority")
            print("Stats: Handled \(handledMessages) of \(totalMessages)")
            handled = true
        }
        return super.sendMessage(msg, handled: handled)
    }
}
