//
//  Floorplans.swift
//  The Abstract Factory Method Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

protocol Floorplan {
    var seats: Int { get }
    var enginePosition: EngineOption { get }
}

enum EngineOption: String {
    case front = "Front"
    case mid = "Mid"
}

class ShortFloorplan: Floorplan {
    var seats: Int = 2
    var enginePosition: EngineOption = EngineOption.mid
}

class StandardFloorplan: Floorplan {
    var seats: Int = 4
    var enginePosition: EngineOption = EngineOption.front
}

class LongFloorplan: Floorplan {
    var seats: Int = 8
    var enginePosition: EngineOption = EngineOption.front
}
