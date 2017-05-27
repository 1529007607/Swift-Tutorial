//
//  Pool.swift
//  The Object Pool Pattern
//
//  Created by Andrew Chai on 5/20/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class Pool<T: AnyObject> {
    private var data = [T]()
    private let arrayQ = DispatchQueue(label: "arrayQ", qos: .utility, attributes: .initiallyInactive, autoreleaseFrequency: .workItem)
    private let semaphore: DispatchSemaphore
    private var itemCount = 0
    private let maxItemCount: Int
    private let itemFactory: () -> T
    private var ejectedItems = 0
    private var poolExhausted = false
    
    init(maxItemCount: Int, factory: @escaping () -> T) {
        self.itemFactory = factory
        self.maxItemCount = maxItemCount
        semaphore = DispatchSemaphore(value: maxItemCount)
    }
    
    func get(maxWaitSeconds: Int = 5) -> T? {
        var result: T?
        
        let waitTime = maxWaitSeconds == -1 ? DispatchTime.distantFuture : DispatchTime(uptimeNanoseconds: UInt64(maxWaitSeconds))
        
        if !poolExhausted {
            if semaphore.wait(timeout: waitTime) == .success {
                if !poolExhausted {
                    arrayQ.sync {
                        if self.data.count == 0 && self.itemCount < self.maxItemCount {
                            self.itemCount += 1
                        } else {
                            result = data.remove(at: 0)
                        }
                    }
                }
            }
        }
        return result
    }
    
    func back(toPool item: T) {
        arrayQ.async {
            if let pitem = item as AnyObject as? PoolItem {
                if pitem.canReuse {
                    self.data.append(item)
                    self.semaphore.signal()
                } else {
                    self.ejectedItems += 1
                    if self.ejectedItems == self.maxItemCount {
                        self.poolExhausted = true
                        self.flushQueue()
                    }
                }
            } else {
                self.data.append(item)
            }
        }
    }
    
    private func flushQueue() {
        let dQueue = DispatchQueue(label: "drainer", qos: .utility
            , attributes: .concurrent, autoreleaseFrequency: .workItem)
        var backlogCleared = false
        
        dQueue.async {
            _ = self.semaphore.wait(timeout: .distantFuture)
            backlogCleared = true
        }
        
        dQueue.async {
            while(!backlogCleared) {
                self.semaphore.signal()
            }
        }
    }
    
    func processPoolItems(callback: ([T]) -> Swift.Void) {
        arrayQ.sync(flags: .barrier) { () in
            callback(self.data)
        }
    }
}
