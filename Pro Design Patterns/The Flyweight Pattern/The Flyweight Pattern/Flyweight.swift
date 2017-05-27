//
//  Flyweight.swift
//  The Flyweight Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

protocol Flyweight {
    subscript(index: Coordinate) -> Int? { get set }
    var total: Int { get }
    var count: Int { get }
}

extension Dictionary {
    init(setupFunc: () -> [(key: Key, value: Value)]) {
        self.init()
        for item in setupFunc() {
            self[item.key] = item.value
        }
    }
}

class FlyweightFactory {
    class func createFlyweight() -> Flyweight {
        return FlyweightImplementation(extrinsic: extrinsicData)
    }
    
    private class var extrinsicData: [Coordinate: Cell] {
        get {
            struct singletonWrapper {
                static let singletonData = Dictionary<Coordinate, Cell> { () -> [(key: Coordinate, value:Cell)] in
                    var results = [(Coordinate, Cell)]()
                    let letters: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    let rows = 50
                    
                    for l in letters.characters {
                        for r in 1...rows {
                            let cell = Cell(col: l, row: r, val: r)
                            results.append((cell.coordinate, cell))
                        }
                    }
                    return results
                }
            }
            return singletonWrapper.singletonData
        }
    }
}

class FlyweightImplementation: Flyweight {
    private let extrinsicData: [Coordinate: Cell]
    private var intrinsicData: [Coordinate: Cell]
    private let queue: DispatchQueue
    
    init(extrinsic: [Coordinate: Cell]) {
        self.extrinsicData = extrinsic
        self.intrinsicData = Dictionary<Coordinate, Cell>()
        self.queue = DispatchQueue(label: "dataQ", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem)
    }
    
    subscript(key: Coordinate) -> Int? {
        get {
            var result: Int?
            queue.sync {
                if let cell = intrinsicData[key] {
                    result = cell.value
                } else {
                    result = extrinsicData[key]?.value
                }
            }
            return result
        }
        set {
            if newValue != nil {
                queue.sync(flags: .barrier, execute: { () -> Swift.Void in
                    intrinsicData[key] = Cell(col: key.col, row: key.row, val: newValue!)
                })
            }
        }
    }
    
    var total: Int {
        var result = 0
        queue.sync {
            result = extrinsicData.values.reduce(0, { (total, cell) in
                if let intrinsicCell = self.intrinsicData[cell.coordinate] {
                    return total + intrinsicCell.value
                } else {
                    return total + cell.value
                }
            })
        }
        return result
    }
    
    var count: Int {
        var result = 0
        queue.sync {
            result = intrinsicData.count
        }
        return result
    }
}














