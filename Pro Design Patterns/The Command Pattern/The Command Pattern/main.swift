//
//  main.swift
//  The Command Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

let calc = Calculator()
calc.add(10)
calc.multiply(4)
calc.subtract(2)

print("Calc 1 Total: \(calc.total)")

let macro = calc.getMacroCommand()

let calc2 = Calculator()
macro(calc2)
print("Calc 2 Total: \(calc2.total)")
