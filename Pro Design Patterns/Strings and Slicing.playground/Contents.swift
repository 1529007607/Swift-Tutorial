//: Playground - noun: a place where people can play

import Foundation

let world = "Hello, world!".characters.suffix(6).dropLast()
String(world)

let commaSeparatedArray = "a,b,c".characters.split{ $0 == "," }
commaSeparatedArray.map(String.init)

extension String {
    func wrapped(after: Int = 70) -> String {
        var i = 0
        let lines = self.characters.split( omittingEmptySubsequences: false) { (character) -> Bool in
            switch character {
            case "\n", " " where i >= after:
                i = 0
                return true
            default:
                i += 1
                return false
            }
        }.map(String.init)
        return lines.joined(separator: "\n")
    }
}

let paragraph = "The quick brown fox jumped over the lazy dog."
paragraph.wrapped(after: 15)

/// consider writing a version that takes a sequence of multiple separators
extension Collection where Iterator.Element: Equatable {
    func split<S: Sequence>(separators: S) -> [SubSequence] where Iterator.Element == S.Iterator.Element {
        return split { separators.contains($0) }
    }
}

"Hello, world!".characters.split(separators: ",! ".characters).map(String.init)