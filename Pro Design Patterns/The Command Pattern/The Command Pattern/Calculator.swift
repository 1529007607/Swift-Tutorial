//
//  Calculator.swift
//  The Command Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class Calculator {
    private(set) var total = 0
    typealias CommandClosure = (Calculator) -> Swift.Void
    private var history = [CommandClosure]()
    /// Applying Concurrent Protections
    private var queue = DispatchQueue(label: "arrayQ")
    
    func add(_ amount: Int) {
        addMacro(Calculator.add, amount: amount)
        total += amount
    }
    
    func subtract(_ amount: Int) {
        addMacro(Calculator.subtract, amount: amount)
        total -= amount
    }
    
    func multiply(_ amount: Int) {
        addMacro(Calculator.multiply, amount: amount)
        total = total * amount
    }
    
    func divide(_ amount: Int) {
        addMacro(Calculator.divide, amount: amount)
        total = total / amount
    }
    
    private func addMacro(_ method: @escaping (Calculator) -> ((Int) -> Swift.Void), amount: Int) {
        queue.sync {
            history.append({ calc in method(calc)(amount) })
        }
    }
    
    func getMacroCommand() -> (Calculator) -> Swift.Void {
        var commands = [CommandClosure]()
        queue.sync {
            commands = history
        }
        return { calc in
            if commands.count > 0 {
                for index in 0..<commands.count {
                    commands[index](calc)
                }
            }
        }
    }
}
