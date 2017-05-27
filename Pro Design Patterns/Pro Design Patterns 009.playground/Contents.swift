//: Playground - noun: a place where people can play

import UIKit

class DataItem {
    enum ItemType: String {
        case Email = "Email Address"
        case Phone = "Telephone Number"
        case Card = "Credit Card Number"
    }
    
    var type: ItemType
    var data: String
    
    init(type: ItemType, data: String) {
        self.type = type
        self.data = data
    }
}

class BackupServer {
    let name: String
    private var data = [DataItem]()
    
    private init(name: String) {
        self.name = name
        globalLogger.log(msg: "Created new server \(name)")
    }
    
    func backup(item: DataItem) {
        data.append(item)
        globalLogger.log(msg: "\(name) backed up item of type \(item.type.rawValue)")
    }
    
    func getData() -> [DataItem] {
        return data
    }
    
    static let server = BackupServer(name: "MainServer")
}

final class Logger {
    private var data = [String]()
    
    static let shared = Logger()
    
    private init() {
        // do nothing - required to stop instance being
        // created by code in other files
    }
    
    func log(msg: String) {
        data.append(msg)
    }
    
    func printLog() {
        for msg in data {
            print("Log: \(msg)")
        }
    }
}

let globalLogger = Logger.shared

var server = BackupServer.server

let group = DispatchGroup()
let queue = DispatchQueue(label: "workQueue", qos: .background, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil)

for count in 0..<100 {
    
}

group.wait()
