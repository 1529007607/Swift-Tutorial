//: Playground - noun: a place where people can play

import UIKit

typealias Wen = Int

class Cock {
    static var price: Wen {
        return 5
    }
}

class Hen {
    static var price: Wen {
        return 3
    }
}

class Chick {
    static var price: Wen {
        return 1 / 3
    }
}

class BuyChicken {
//    let money: Wen = 100
    
    var cocks: [Cock]!
    var hens: [Hen]!
    var chicken: [Chick]!
    
    func buy(cost money: Wen, toBuy totalCount: Int) -> [(cocks: Int, hens: Int, chicken: Int)] {
        var results = [(Int, Int, Int)]()
        
        let maxCocksCount = Int(money / Cock.price)
        let maxHensCount = Int((money - Cock.price) / Hen.price)
        
        for i in 1..<maxCocksCount {
            for j in 1..<maxHensCount {
                let cocksCost = i * Cock.price
                let hensCost = j * Hen.price
                
                var k = 3
                while k < 100 {
                    let chickenCost = Int(k / 3)
                    if cocksCost + hensCost +  chickenCost == money,
                        i + j + k == totalCount {
                        results.append((cocks: i, hens: j, chicken: k))
                        break
                    }
                    k += 3
                }
            }
        }
        
        return results
    }
}

let buy = BuyChicken()
let results = buy.buy(cost: 100, toBuy: 100)

for result in results {
    print("cocks: \(result.cocks), hens: \(result.hens), chicken: \(result.chicken)")
    print("5 * \(result.cocks) + 3 * \(result.hens) + 1/3 * \(result.chicken) == 100")
    let sum = 5 * result.cocks + 3 * result.hens + result.chicken / 3
    print(sum)
}


