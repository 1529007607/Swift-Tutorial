//
//  Shapes.swift
//  The Visitor Pattern
//
//  Created by Andrew Chai on 5/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class Circle: Shape {
    let radius: Float
    
    init(radius: Float) {
        self.radius = radius
    }
    
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
}

class Square: Shape {
    let length: Float
    
    init(length: Float) {
        self.length = length
    }
    
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
}

class Rectangle: Shape {
    let xLen: Float
    let yLen: Float
    
    init(x: Float, y: Float) {
        self.xLen = x
        self.yLen = y
    }
    
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
}

class ShapeCollection {
    let shapes: [Shape]
    
    init() {
        shapes = [
            Circle(radius: 2.5), Square(length: 4), Rectangle(x: 10, y: 2)
        ]
    }
    
    func accept(_ visitor: Visitor) {
        for shape in shapes {
            shape.accept(visitor)
        }
    }
}



















