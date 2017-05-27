//
//  Food.swift
//  The Builder Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class Burger {
    let customName: String
    let veggieProduct: Bool
    let patties: Int
    let pickles: Bool
    let mayo: Bool
    let ketchup: Bool
    let lettuce: Bool
    let cook: Cooked
    let bacon: Bool
    
    enum Cooked: String {
        case rare = "Rare"
        case normal = "Normal"
        case wellDone = "Well Done"
    }
    
    init(name: String, veggie: Bool, patties: Int, pickles: Bool, mayo: Bool, ketchup: Bool, lettuce: Bool, cook: Cooked, bacon: Bool) {
        self.customName = name
        self.veggieProduct = veggie
        self.patties = patties
        self.pickles = pickles
        self.mayo = mayo
        self.ketchup = ketchup
        self.lettuce = lettuce
        self.cook = cook
        self.bacon = bacon
    }
    
    func printDescription() {
        print("Name \(self.customName)")
        print("Veggie: \(self.veggieProduct)")
        print("Patties: \(self.patties)")
        print("Pickles: \(self.pickles)")
        print("Mayo: \(self.mayo)")
        print("Ketchup: \(self.mayo)")
        print("Lettuce: \(self.lettuce)")
        print("Cook: \(self.cook.rawValue)")
        print("Bacon: \(self.bacon)")
    }
}
