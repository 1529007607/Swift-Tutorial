//
//  Airplane.swift
//  The Mediator Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

struct Position {
    var distanceFromRunway: Int
    var height: Int
}

class Airplane: MessagePeer {
    var name: String
    var currentPosition: Position
    var mediator: MessageMediator
    /// Implementing concurrency protections in the peer
    let queue = DispatchQueue(label: "posQ", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .workItem)
    
    init(name: String, initialPos: Position, mediator: MessageMediator) {
        self.name = name
        self.currentPosition = initialPos
        self.mediator = mediator
        mediator.registerPeer(self)
    }
    
    func otherPlaneDidChangePosition(_ position: Position) -> Bool {
        var result = false
        queue.sync {
            result = position.distanceFromRunway == currentPosition.distanceFromRunway &&
                abs(position.height - currentPosition.height) < 1000
        }
        return result
    }
    
    func handleMessage(_ messageType: String, data: Any?) -> Any? {
        var result: Any?
        switch messageType {
        case "changePos":
            if let pos = data as? Position {
                result = otherPlaneDidChangePosition(pos)
            }
        default:
            fatalError("Unknown message type")
        }
        return result
    }
    
    func changePosition(_ newPosition: Position) {
        _ = queue.sync(flags: .barrier) {
            currentPosition = newPosition
            
            let allResults = mediator.sendMessage(self, messageType: "changePos", data: newPosition)
            for result in allResults {
                if result as? Bool == true {
                    print("\(self.name): Too close! Abort!")
                    return
                }
            }
            print("\(name): Position changed")
        }
    }
    
    func land() {
        _ = queue.sync(flags: .barrier, execute: {
            currentPosition = Position(distanceFromRunway: 0, height: 0)
            mediator.unregisterPeer(self)
            print("\(name): Landed")
        })
    }
    
    static func ==(lhs: Airplane, rhs: Airplane) -> Bool {
        return lhs.name == rhs.name
    }
}












