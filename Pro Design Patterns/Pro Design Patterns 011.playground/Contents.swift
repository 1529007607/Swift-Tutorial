//: Playground - noun: a place where people can play

import Foundation

final class Logger<T> where T: NSObject, T: NSCopying {
    var dataItems: [T] = []
    var callback: (T) -> Swift.Void
    var arrayQ = DispatchQueue(label: "arrayQ", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem)
    var callbackQ = DispatchQueue(label: "callbackQ", qos: .utility, attributes: .initiallyInactive, autoreleaseFrequency: .workItem)
    
    init(callback: @escaping (T) -> Swift.Void, protect: Bool = true) {
        self.callback = callback
        if protect {
            self.callback = { T in
                self.callbackQ.sync {
                    callback(T)
                }
            }
        }
    }
    
    func logItem(item: T) {
        arrayQ.async(qos: .utility, flags: .barrier) { 
            self.dataItems.append(item.copy() as! T)
            self.callback(item)
        }
    }
    
    func processItems(callback: (T) -> Swift.Void) {
        arrayQ.sync {
            for item in self.dataItems {
                callback(item)
            }
        }
    }
}
