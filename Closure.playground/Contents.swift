//: Playground - noun: a place where people can play

import Foundation

let closure = {
    print("This is a closure.")
}

closure()

/// Closure with parameters
let closureWithParameters = { (int: Int, dou: Double) in
    print("\(int), \(dou)")
}

closureWithParameters(5, 0.5)

/// Closure as a parameter
let closureWithClosureParemeter = { (closure: () -> Void) in
    closure()
}

closureWithClosureParemeter(closure)

func funcAsClosure() {
    print("This is a function as Closure")
}

closureWithClosureParemeter(funcAsClosure)
