//
//  Channels.swift
//  The Bridge Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class Channel {
    enum Channels {
        case landline
        case wireless
        case satellite
    }
    
    class func getChannel(channelType: Channels) -> Channel {
        switch channelType {
        case .landline:
            return LandlineChannel()
        case .wireless:
            return WirelessChannel()
        case .satellite:
            return SatelliteChannel()
        }
    }
    
    func send(_ msg: Message) {
        fatalError("Not implemented")
    }
}

class LandlineChannel: Channel {
    override func send(_ msg: Message) {
        print("Landline: \(msg.contentToSend)")
    }
}

class WirelessChannel: Channel {
    override func send(_ msg: Message) {
        print("Wireless: \(msg.contentToSend)")
    }
}
