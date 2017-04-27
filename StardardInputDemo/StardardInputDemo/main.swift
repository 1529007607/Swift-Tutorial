//
//  main.swift
//  StardardInputDemo
//
//  Created by Andrew Chai on 4/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

print("Hello, World!")

func input() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let strData = String(data: inputData, encoding: .utf8)!
    let trimmedStr = strData.trimmingCharacters(in: .newlines)
    return trimmedStr
}

let inputa = input()
print(inputa)
