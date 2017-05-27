//
//  Commands.swift
//  The Command Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//


/// Using Commands as Macros
protocol Command {
    func execute(_ receiver: Any)
}

/// Creating Composite Commands
class CommandWrapper: Command {
    private let commands: [Command]
    
    init(commands: [Command]) {
        self.commands = commands
    }
    
    func execute(_ receiver: Any) {
        for command in commands {
            command.execute(receiver)
        }
    }
}

class GenericCommand<T>: Command {
    private var instructions: (T) -> Void
    
    init(instructions: @escaping (T) -> Void) {
        self.instructions = instructions
    }
    
    func execute(_ receiver: Any) {
        if let safeReceiver = receiver as? T {
            instructions(safeReceiver)
        } else {
            fatalError("Receiver is not expected type")
        }
    }
    
    class func createCommand(_ instructions: @escaping (T) -> Swift.Void) -> Command {
        return GenericCommand(instructions: instructions)
    }
}
