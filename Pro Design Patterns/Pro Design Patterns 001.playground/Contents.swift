//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, playground"

var counter = 0
var secondCounter = 0

for i in 0..<10 {
    counter += 1
    print("Counter: \(counter)")
    for j in 1...10 {
        secondCounter += j
    }
}
