//
//  NewFeatures.swift
//  The Bridge Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class SatelliteChannel: Channel {
    override func send(_ msg: Message) {
        print("Satellite: \(msg.contentToSend)")
    }
}

class PriorityMessage: ClearMessage {
    override var contentToSend: String {
        return "Important: \(super.contentToSend)"
    }
}
