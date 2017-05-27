//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/// substring(to: String.Index)
let index = str.index(str.startIndex, offsetBy: 5)
str.substring(to: index)

/// substring(from: String.Index)
let index1 = str.index(str.startIndex, offsetBy: 7)
str.substring(from: index)

/// substring(with: Range)
let start = str.index(str.startIndex, offsetBy: 7)
let end = str.index(str.endIndex, offsetBy: -6)
let range = start..<end
str.substring(with: range)



