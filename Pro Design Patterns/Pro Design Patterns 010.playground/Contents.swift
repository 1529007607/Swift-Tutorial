//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport

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

final class BackupServer {
    let name: String
    private var data = [DataItem]()
    private let arrayQ = DispatchQueue(label: "arrayQ", qos: .utility, attributes: .initiallyInactive, autoreleaseFrequency: .workItem, target: nil)
    
    private init(name: String) {
        self.name = name
    }
    
    func backup(item: DataItem) {
        arrayQ.sync {
            self.data.append(item)
        }
    }
    
    func getData() -> [DataItem] {
        return data
    }
    
    static let server = BackupServer(name: "MainServer")
}