//
//  Sequence.swift
//  The Strategy Pattern
//
//  Created by Andrew Chai on 5/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

final class CLSequence {
    private var numbers: [Int]
    
    init(_ numbers: Int...) {
        self.numbers = numbers
    }
    
    func addNumber(_ value: Int) {
        numbers.append(value)
    }
    
    func compute(_ strategy: Strategy) -> Int {
        return strategy.execute(numbers)
    }
}
