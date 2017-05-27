//
//  NetworkRequest.swift
//  The Proxy Pattern 01
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

protocol NetworkConnection {
    func connect()
    func disconnect()
    func sendCommand(command: String)
}

class NetworkConnectionFactory {
    class func createNetworkConnection() -> NetworkConnection {
        return connectionProxy
    }
    
    static let connectionProxy = NetworkRequestProxy()
}

private class NetworkConnectionImplemention: NetworkConnection {
    typealias me = NetworkConnectionImplemention
    
    func connect() {
        me.writeMessage("Connect")
    }
    
    func disconnect() {
        me.writeMessage("Disconnect")
    }
    
    func sendCommand(command: String) {
        me.writeMessage("Command: \(command)")
        Thread.sleep(forTimeInterval: 1)
        me.writeMessage("Command completed: \(command)")
    }
    
    private class func writeMessage(_ msg: String) {
        queue.async {
            print(msg)
        }
    }
    
    static let queue = DispatchQueue(label: "writeQ", qos: .utility, attributes: .initiallyInactive, autoreleaseFrequency: .workItem)
}

class NetworkRequestProxy: NetworkConnection {
    private let wrappedRequest: NetworkConnection
    private let queue = DispatchQueue(label: "commandQ", qos: .utility, attributes: .initiallyInactive, autoreleaseFrequency: .workItem)
    private var referenceCount: Int = 0
    private var connected = false
    
    init() {
        wrappedRequest = NetworkConnectionImplemention()
    }
    
    func connect() {
        // do nothing
    }
    
    func disconnect() {
        // do nothing
    }
    
    func sendCommand(command: String) {
        self.referenceCount += 1
        queue.sync {
            if !self.connected && self.referenceCount > 0 {
                self.wrappedRequest.connect()
                self.connected = true
            }
            self.wrappedRequest.sendCommand(command: command)
            self.referenceCount -= 1
            if self.connected && self.referenceCount == 0 {
                self.wrappedRequest.disconnect()
                self.connected = false
            }
        }
    }
}












