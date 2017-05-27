//: Playground - noun: a place where people can play

import Foundation

extension String {
    func words(with charset: CharacterSet = .alphanumerics) ->  [String] {
        return self.unicodeScalars.split {
            !charset.contains($0)
        }.map(String.init)
    }
}

let s = "Wow! This contains _all_ kinds of things like 123 and \"quotes\"?"
s.words()

/// UTF16 can access random
extension Collection where
    Iterator.Element: Equatable,
    SubSequence.Iterator.Element == Iterator.Element,
    Indices.Iterator.Element == Index {
    func search<S: Sequence>(_ pattern: S) -> Index? where S.Iterator.Element == Iterator.Element {
        return indices.first(where: { (idx) -> Bool in
            self[idx..<endIndex].starts(with: pattern)
        })
    }
}
let helloWorld = "Hello, world!"
if let idx = helloWorld.utf16.search("world".utf16)?
    .samePosition(in: helloWorld)
{
    print(helloWorld[idx..<helloWorld.endIndex])
}