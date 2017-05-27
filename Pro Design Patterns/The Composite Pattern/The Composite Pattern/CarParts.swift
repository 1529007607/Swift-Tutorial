//
//  CarParts.swift
//  The Composite Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

protocol CarPart {
    var name: String { get }
    var price: Float { get }
    
    func addPart(_ part: CarPart)
    func removePart(_ part: CarPart)
}

class Part: CarPart {
    let name: String
    let price: Float
    
    init(name: String, price: Float) {
        self.name = name
        self.price = price
    }
    
    func addPart(_ part: CarPart) {
        // do nothing
    }
    
    func removePart(_ part: CarPart) {
        // do nothing
    }
}

class CompositePart: CarPart {
    let name: String
    private var parts: [CarPart]
    
    init(name: String, parts: CarPart...) {
        self.name = name
        self.parts = parts
    }
    
    var price: Float {
        return parts.reduce(0, { $0 + $1.price })
    }
    
    func addPart(_ part: CarPart) {
        parts.append(part)
    }
    
    func removePart(_ part: CarPart) {
        for index in 0..<parts.count {
            if parts[index].name == part.name {
                parts.remove(at: index)
                break
            }
        }
    }
}










