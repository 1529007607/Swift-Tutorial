//: Playground - noun: a place where people can play

import UIKit

typealias egg = Int

func fetchEggs(divideBy divisor: Int, _ dividend: Int) -> (Int) -> Int{
    
    func divide(_ divident: Int) -> Int{
        return divident % divisor
    }
    
    return divide
}

func getFetcher (_ divident: Int) -> [(Int) -> Int]
{
    var result = [(Int) -> Int]()
    for j in 2...9 {
        result.append(fetchEggs(divideBy: j, divident))
    }
    return result
}

func sumEggs() {
    var i = 0
    var result = true
    while result {
        i += 1
        
        let results = getFetcher(i)
        
        if results[0] (i) == 1,
            results[1] (i) == 0,
            results[2] (i) == 1,
            results[3] (i) == 4,
            results[4] (i) == 3,
            results[5] (i) == 0,
            results[6] (i) == 1,
            results[7] (i) == 0 {
            result = false
            print(i)
        }
    }
}

sumEggs()
