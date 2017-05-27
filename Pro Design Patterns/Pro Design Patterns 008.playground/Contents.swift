//: Playground - noun: a place where people can play

import UIKit

class Logger<T: NSObject, NSCopying> {
    var dataItems: [T] = []
    var callback: (T) -> Swift.Void
    
    init(callback: @escaping (T) -> Swift.Void) {
        self.callback = callback
    }
    
    func logItem(item: T) {
        dataItems.append(item.copy() as! T)
        callback(item)
    }
    
    func processItems(callback: (T) -> Swift.Void) {
        for item in dataItems {
            callback(item)
        }
    }
}