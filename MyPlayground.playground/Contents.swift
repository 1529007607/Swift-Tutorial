//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

for x in sequence(first: 0.1, next: { $0 * 2 }).prefix(while: { $0 < 4 }) {
    print(x)
}



