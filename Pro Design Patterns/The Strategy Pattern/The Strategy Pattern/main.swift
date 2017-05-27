//
//  main.swift
//  The Strategy Pattern
//
//  Created by Andrew Chai on 5/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

let seq = CLSequence(1, 2, 3, 4)
seq.addNumber(10)
seq.addNumber(20)

let sumStrategy = SumStrategy()
let multiplyStrategy = MultiplyStrategy()

let sum = seq.compute(sumStrategy)
print("Sum: \(sum)")

let multiply = seq.compute(multiplyStrategy)
print("Multiply: \(multiply)")

let filterThreshold = 10
let cstrategy = ClosureStrategy { (values) -> Int in
    return values.filter{ $0 < filterThreshold }.reduce(0, +)
}

let filteredSum = seq.compute(cstrategy)
print("Filtered Sum: \(filteredSum)")
