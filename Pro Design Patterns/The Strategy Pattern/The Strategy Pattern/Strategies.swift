//
//  Strategies.swift
//  The Strategy Pattern
//
//  Created by Andrew Chai on 5/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

protocol Strategy {
    func execute(_ values: [Int]) -> Int
}

class ClosureStrategy: Strategy {
    private let closure: ([Int]) -> Int
    
    init(_ closure: @escaping ([Int]) -> Int) {
        self.closure = closure
    }
    
    func execute(_ values: [Int]) -> Int {
        return closure(values)
    }
}

class SumStrategy: Strategy {
    func execute(_ values: [Int]) -> Int {
        return values.reduce(0, +)
    }
}

class MultiplyStrategy: Strategy {
    func execute(_ values: [Int]) -> Int {
        return values.reduce(1, *)
    }
}
