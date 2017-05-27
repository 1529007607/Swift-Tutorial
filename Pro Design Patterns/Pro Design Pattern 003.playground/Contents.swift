//: Playground - noun: a place where people can play

import UIKit

class Sum: NSObject, NSCopying {
    var resultsCache: [[Int]]
    var firstValue: Int
    var secondValue: Int
    
    init(first: Int, second: Int) {
        resultsCache = Array(repeating: Array(repeatElement(0, count: 10)), count: 10)
        for i in 0..<10 {
            for j in 0..<10 {
                resultsCache[i][j] = i + j
            }
        }
        firstValue = first
        secondValue = second
    }
    
    private init(first: Int, second: Int, cache: [[Int]]) {
        self.firstValue = first
        self.secondValue = second
        resultsCache = cache
    }
    
    var result: Int {
        get {
            return firstValue < resultsCache.count && secondValue < resultsCache[firstValue].count ? resultsCache[firstValue][secondValue] : firstValue + secondValue
        }
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Sum(first: firstValue, second: secondValue, cache: resultsCache)
    }
}

var prototype = Sum(first: 0, second: 9)
var calc1 = prototype.result
var clone = prototype.copy() as! Sum
clone.firstValue = 3
clone.secondValue = 8
var calc2 = clone.result

print("Calc1: \(calc1) Calc2: \(calc2)")
