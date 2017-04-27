//
//  main.swift
//  CodeStatistics
//
//  Created by Andrew Chai on 4/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

print("Hello, World!")

let path = "/Users/magerate1129/Desktop/Swift-Tutorial/CodeStatistics/CodeStatistics/main.swift"
let fileStatistics = FileStatistics(path: path)
var lineCount = fileStatistics.lineCountExcludeBlankLine
print(lineCount)
var size = fileStatistics.size
print(size)

let path1 = "/Users/magerate1129/Desktop/Swift-Tutorial/CodeStatistics/CodeStatistics/FileStatistics.swift"
fileStatistics.path = path1
lineCount = fileStatistics.lineCountExcludeBlankLine
print(lineCount)

size = fileStatistics.size
print(size)
