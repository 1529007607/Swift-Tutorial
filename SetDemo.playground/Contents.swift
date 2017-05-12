//: Playground - noun: a place where people can play

import UIKit

var set1: Set = [1, 3, 5, 7, 9]
var set2: Set = [2, 4, 5, 7, 9]

print(set1.union(set2))
print(set1.intersection(set2))
print(set1.subtracting(set2))
print(set1.symmetricDifference(set2))

let num1 = NSNumber(integerLiteral: 10)
let num2 = NSNumber(integerLiteral: 10)
print(num1 == num2)
print(num1 === num2)

let index: Set<Int>.Index? = set1.index { $0 == 1 }
set1[index!]


