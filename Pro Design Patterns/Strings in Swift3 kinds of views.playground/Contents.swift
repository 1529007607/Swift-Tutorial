//: Playground - noun: a place where people can play

import Foundation

/// Grapheme Clusters and Canonical Equivalence
let single = "Pok\u{00E9}mon"
let double = "Pok\u{0065}\u{0301}mon"

/// Strings and Collections
extension String: Collection {
    // Nothing needed here - it already has the necessary implementations
}
var greeting = "Hello, world!"
greeting.dropFirst(7)

let s = "abcdef"
// Advance 5 from the start
let idx = s.index(s.startIndex, offsetBy: 5)
s[idx]

//there is a risk of advencing past the end of the string
let safeIdx = s.index(s.startIndex, offsetBy: 400, limitedBy: s.endIndex)
safeIdx

//Do not use too much. It's horribly inefficient.
extension String {
    subscript(idx: Int) -> Character {
        guard let strIdx = index(startIndex, offsetBy: idx, limitedBy: endIndex) else {
            fatalError("String index out of bounds")
        }
        return self[strIdx]
    }
}
s[5]

s[s.startIndex..<s.index(s.startIndex, offsetBy: 4)]

s.characters.prefix(4)
for (i, c) in "hello".characters.enumerated() {
    print("\(i): \(c)")
}

var hello = "Hello!"
if let idx = hello.characters.index(of: "!") {
    hello.insert(contentsOf: ", world", at: idx)
}

extension String: RangeReplaceableCollection {}

if let comma = greeting.index(of: ",") {
    print(greeting[greeting.startIndex..<comma])
    greeting.replaceSubrange(greeting.startIndex..<greeting.endIndex, with: "How about some original example strings?")
}