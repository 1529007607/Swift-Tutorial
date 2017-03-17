//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Pet {
    let name: String
    let age: Int
}

let cat = Pet(name: "white", age: 2)
let dog = Pet(name: "black", age: 3)

let arr = [cat, dog]
let arr1 = [dog, cat]

func ==(lsh: [Pet], rsh:[Pet]) -> Bool {
    guard lsh.count == rsh.count else {
        return false
    }
    
    var c = 0
    for l in lsh {
        for r in rsh {
            if l.age == r.age,
                l.name == l.name {
                c += 1
            }
        }
    }
    
    if c == lsh.count {
        return true
    }
    
    return false
}

if arr == arr1 {
    print("same struct array")
}

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.age = age
        self.name = name
    }
}

//extension Person: Equatable {
//    public static func ==(lhs: Person, rhs: Person) -> Bool {
//        return true
//    }
//}

let ming = Person(name: "ming", age: 2)
let hong = Person(name: "hong", age: 3)
let zhou = Person(name: "zhou", age: 4)

let arr2 = [ming, hong]
let arr3 = [hong, ming]

func ==(lsh: [Person], rsh: [Person]) -> Bool {
    guard lsh.count == rsh.count else {
        return false
    }
    
    var c = 0
    for l in lsh {
        for r in rsh {
            if l === r {
                c += 1
            }
        }
    }
    
    if c == lsh.count {
        return true
    }
    
    return false
}

if arr2 == arr3 {
    print("same class array")
}
