//
//  Memento.swift
//  The Memento Pattern
//
//  Created by Andrew Chai on 5/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

protocol Memento {
    // no methods or properties defined
}

protocol Originator {
    func createMemento() -> Memento
    func applyMemento(_ memento: Memento)
}
