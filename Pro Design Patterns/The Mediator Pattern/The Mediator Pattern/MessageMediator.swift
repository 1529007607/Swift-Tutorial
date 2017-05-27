//
//  MessageMediator.swift
//  The Mediator Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

/// Generalizing the mediator with messages
protocol MessagePeer {
    var name: String { get }
    func handleMessage(_ messageType: String, data: Any?) -> Any?
}

class MessageMediator {
    private var peers = [String: MessagePeer]()
    
    func registerPeer(_ peer: MessagePeer) {
        peers[peer.name] = peer
    }
    
    func unregisterPeer(_ peer: MessagePeer) {
        peers.removeValue(forKey: peer.name)
    }
    
    func sendMessage(_ caller: MessagePeer, messageType: String, data: Any) -> [Any?] {
        var results = [Any?]()
        for peer in peers.values {
            if peer.name != caller.name {
                results.append(peer.handleMessage(messageType, data: data))
            }
        }
        return results
    }
}
