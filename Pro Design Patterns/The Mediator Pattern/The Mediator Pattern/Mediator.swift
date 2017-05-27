//
//  Mediator.swift
//  The Mediator Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

protocol Peer {
    var name: String { get }
    /// Putting more logic into the mediator
    var currentPosition: Position { get }
    func otherPlaneDidChangePosition(_ position: Position) -> Bool
}

protocol Mediator {
    func registerPeer(_ peer: Peer)
    func unregisterPeer(_ peer: Peer)
    func changePosition(_ peer: Peer, pos: Position) -> Bool
}

class AirplaneMediator: Mediator {
    private var peers = [String: Peer]()
    /// Implementing concurrency protections in the mediator
    private let queue = DispatchQueue(label: "dictQ", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .workItem)
    
    
    func registerPeer(_ peer: Peer) {
        _ = queue.sync(flags: .barrier) {
            peers[peer.name] = peer
        }
    }
    
    func unregisterPeer(_ peer: Peer) {
        _ = queue.sync(flags: .barrier) {
            peers.removeValue(forKey: peer.name)
        }
    }
    
    func changePosition(_ peer: Peer, pos: Position) -> Bool {
        var result = false
        queue.sync {
            // Eliminate those planes that are farther away
            let closerPeers = peers.values.filter({ (p) -> Bool in
                return p.currentPosition.distanceFromRunway <= pos.distanceFromRunway
            })
            
            for storedPeer in closerPeers {
                if peer.name != storedPeer.name &&
                    storedPeer.otherPlaneDidChangePosition(pos) {
                    result = true
                }
            }
        }
        
        return result
    }
}
