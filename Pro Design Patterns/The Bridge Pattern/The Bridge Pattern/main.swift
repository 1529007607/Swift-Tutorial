//
//  main.swift
//  The Bridge Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

let bridge = CommunicatorBridge(channel: .satellite)
var comms = Communicator(clearChannel: bridge, secureChannel: bridge, priorityChannel: bridge)

comms.sendSecure("This is a secret")
comms.sendCleartext("Hello!")
comms.sendPriority("This is important")

