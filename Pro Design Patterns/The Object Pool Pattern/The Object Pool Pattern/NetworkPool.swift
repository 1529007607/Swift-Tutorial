//
//  NetworkPool.swift
//  The Object Pool Pattern
//
//  Created by Andrew Chai on 5/20/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

final class NetworkPool {
    private let connectionCount = 3
    private var connections = [NetworkConnection]()
    private var semaphore: DispatchSemaphore
    private var queue: DispatchQueue
    private var itemsCreated = 0
    
    private init() {
        semaphore = DispatchSemaphore(value: connectionCount)
        queue = DispatchQueue(label: "networkpoolQ", qos: .userInteractive, attributes: .initiallyInactive, autoreleaseFrequency: .workItem)
    }
    
    private func doGetConnection() -> NetworkConnection {
        _ = semaphore.wait(timeout: .distantFuture)
        var result: NetworkConnection?
        queue.sync {
            if self.connections.count > 0 {
                result = self.connections.remove(at: 0)
            } else if self.itemsCreated < self.connectionCount {
                result = NetworkConnection()
                self.itemsCreated += 1
            }
        }
        return result!
    }
    
    private func doReturnConnection(conn: NetworkConnection) {
        queue.async {
            self.connections.append(conn)
            self.semaphore.signal()
        }
    }
    
    static func getConnection() -> NetworkConnection {
        return shared.doGetConnection()
    }
    
    static func returnConnection(conn: NetworkConnection) {
        shared.doReturnConnection(conn: conn)
    }
    
    static let shared = NetworkPool()
}
