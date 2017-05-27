//
//  CommandMediator.swift
//  The Mediator Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

/// Generalizing the mediator with the command pattern
protocol CommandPeer {
    var name: String { get }
}

class Command {
    let function: (CommandPeer) -> Any
    
    init(function: @escaping (CommandPeer) -> Any) {
        self.function = function
    }
    
    func execute(_ peer: CommandPeer) -> Any {
        return function(peer)
    }
}

class CommandMediator {
    private var peers = [String: CommandPeer]()
    
    func registerPeer(_ peer: CommandPeer) {
        peers[peer.name] = peer
    }
    
    func unregisterPeer(_ peer: CommandPeer) {
        peers.removeValue(forKey: peer.name)
    }
    
    func dispatchCommand(_ caller: CommandPeer, command: Command) -> [Any] {
        var results = [Any]()
        for peer in peers.values {
            if peer.name != caller.name {
                results.append(command.execute(peer))
            }
        }
        return results
    }
}
