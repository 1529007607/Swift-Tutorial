//
//  main.swift
//  The Visitor Pattern
//
//  Created by Andrew Chai on 5/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

let shapes = ShapeCollection()
let areaVisitor = AreaVisitor()
shapes.accept(areaVisitor)
print("Area: \(areaVisitor.totalArea)")
print("----")
let edges = EdgesVisitor()
print("Edges: \(edges.totalEdges)")

