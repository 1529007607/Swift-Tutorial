//
//  main.swift
//  The Memento Pattern
//
//  Created by Andrew Chai on 5/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

let ledger = Ledger()

_ = Ledger.addEntry(ledger)("Bob", amount: 100.43)
_ = Ledger.addEntry(ledger)("Joe", amount: 200.20)

let memento = ledger.createMemento()

ledger.addEntry("Alice", amount: 500)
ledger.addEntry("Tony", amount: 20)

ledger.printEntries()

ledger.applyMemento(memento)

ledger.printEntries()

