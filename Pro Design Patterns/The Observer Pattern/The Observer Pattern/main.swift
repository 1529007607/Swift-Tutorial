//
//  main.swift
//  The Observer Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

// create meta observer
let monitor = AttackMonitor()
MetaSubject.shared.addObserver(monitor)

// create regular observers
let log = ActivityLog()
let cache = FileCache()

let authM = AuthenticationManager()
// register only the regular observer
authM.addObserver(log, cache, monitor)

authM.authenticate(user: "bob", pass: "secret")
print("----")
authM.authenticate(user: "joe", pass: "shhh")
