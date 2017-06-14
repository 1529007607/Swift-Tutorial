//: Playground - noun: a place where people can play

import Foundation

func random(min: Int, max: Int) -> Int {
    var result = 0
    result = min + Int(arc4random_uniform(UInt32(max - min)))
    return result
}

func select<T>(from a: [T], count k: Int) -> [T] {
    var a = a
    for i in 0..<k {
        let r = random(min: i, max: a.count - 1)
        if i != r {
            swap(&a[i], &a[r])
        }
    }
    return Array(a[0..<k])
}

let a = [ "a", "b", "c", "d", "e", "f", "g" ]
select(from: a, count: 3)

// An alternative algorithm - called "reservoir sampling"
func reserviorSample<T>(from a: [T], count k: Int) -> [T] {
    precondition(a.count >= k)
    
    var result = [T]()
    for i in 0..<k {
        result.append(a[i])
    }
    
    for i in k..<a.count {
        let j = random(min: 0, max: i)
        if j < k {
            result[j] = a[i]
        }
    }
    return result
}

reserviorSample(from: a, count: 2)