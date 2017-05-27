//
//  Extensions.swift
//  The ModelViewController Pattern
//
//  Created by Andrew Chai on 5/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element: Equatable {
    func split<S: Sequence>(separators: S) -> [SubSequence] where Iterator.Element == S.Iterator.Element {
        return split { separators.contains($0) }
    }
}

extension String {
    func split() -> [String] {
        return characters.split(separators: " \n".characters).map(String.init)
    }
}

extension Array {
    func unique<T: Equatable>() -> [T] {
        var uniqueValues = [T]()
        for value in self {
            if !uniqueValues.contains(value as! T) {
                uniqueValues.append(value as! T)
            }
        }
        return uniqueValues
    }
}
