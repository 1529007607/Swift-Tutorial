//: Playground - noun: a place where people can play

import UIKit

func fibForNumSteps(numSteps: Int) -> [Int] {
    var sequence = [0, 1]
    guard numSteps > 2 else {
        return sequence
    }
    
    for _ in 0...numSteps {
        let first = sequence[sequence.count - 1]
        let second = sequence.last!
        sequence.append(first + second)
    }
    return sequence
}

func fibRecursionForNumSteps(numSteps: Int, first: Int, second: Int) -> [Int] {
    if numSteps == 0 {
        return []
    }
    return [first + second] + fibRecursionForNumSteps(numSteps: numSteps - 1, first: second, second: first + second)
}
