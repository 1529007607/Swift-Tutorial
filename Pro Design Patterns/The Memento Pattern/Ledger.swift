//
//  Ledger.swift
//  The Memento Pattern
//
//  Created by Andrew Chai on 5/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class LedgerEntry {
    let id: Int
    let counterParty: String
    let amount: Float
    
    init(id: Int, counterParty: String, amount: Float) {
        self.id = id
        self.counterParty = counterParty
        self.amount = amount
    }
}

/// Expressing state as JSON
class LedgerMemento: Memento {
    var jsonData: String?
    
    init(ledger: Ledger) {
        self.jsonData = stringify(ledger)
    }
    
    init(json: String?) {
        self.jsonData = json
    }
    
    private func stringify(_ ledger: Ledger) -> String? {
        return nil
    }
    
    func apply(_ ledger: Ledger) {
        
    }
}

class Ledger: Originator {
    fileprivate var entries = [Int: LedgerEntry]()
    fileprivate var nextId = 1
    var total: Float = 0
    
    func addEntry(_ countryParty: String, amount: Float){
        let entry = LedgerEntry(id: nextId, counterParty: countryParty, amount: amount)
        defer {
            nextId += 1
            entries[entry.id] = entry
            total += amount
        }
    }
    
    func createMemento() -> Memento {
        return LedgerMemento(ledger: self)
    }
    
    func applyMemento(_ memento: Memento) {
        if let m = memento as? LedgerMemento {
            m.apply(self)
        }
    }
    
    func printEntries() {
        for id in entries.keys.sorted(by: <) {
            if let entry = entries[id] {
                print("#\(id): \(entry.counterParty) $\(entry.amount)")
            }
        }
        print("Total: $\(total)")
        print("-----")
    }
}















