//
//  BurgerBuilder.swift
//  The Builder Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

enum Burgers {
    case standard
    case bigBurger
    case superVeggie
}

class BurgerBuilder {
    fileprivate var veggie = false
    fileprivate var pickles = false
    fileprivate var mayo = true
    fileprivate var ketchup = true
    fileprivate var lettuce = true
    fileprivate var cooked = Burger.Cooked.normal
    fileprivate var patties = 2
    fileprivate var bacon = true
    
    internal init() {
        
    }
    
    func setVeggie(choice: Bool) {
        self.veggie = choice
        if choice {
            self.bacon = false
        }
    }
    
    func setPickles(choice: Bool) {
        self.pickles = choice
    }
    
    func setMayo(choice: Bool) {
        self.mayo = choice
    }
    
    func setKetchup(choice: Bool) {
        self.ketchup = choice
    }
    
    func setLettuce(choice: Bool) {
        self.lettuce = choice
    }
    
    func setCooked(choice: Burger.Cooked) {
        self.cooked = choice
    }
    
    func addPatty(choice: Bool) {
        self.patties = choice ? 3 : 2
    }
    
    func setBacon(choice: Bool) {
        self.bacon = choice
    }
    
    func buildObject(name: String) -> Burger {
        return Burger(name: name, veggie: veggie, patties: patties, pickles: pickles, mayo: mayo, ketchup: ketchup, lettuce: lettuce, cook: cooked, bacon: bacon)
    }
    
    class func getBuilder(burgerType: Burgers) -> BurgerBuilder {
        var builder: BurgerBuilder
        switch burgerType {
        case .bigBurger:
            builder = BigBurgerBuilder()
        case .superVeggie:
            builder = SuperVeggieBurgerBuilder()
        case .standard:
            builder = BurgerBuilder()
        }
        return builder
    }
}

class BigBurgerBuilder: BurgerBuilder {
    override init() {
        super.init()
        self.patties = 4
        self.bacon = false
    }
    
    override func addPatty(choice: Bool) {
        fatalError("Cannot add patty to Big Burger")
    }
}

class SuperVeggieBurgerBuilder: BurgerBuilder {
    override init() {
        super.init()
        self.veggie = true
        self.bacon = false
    }
    
    override func setVeggie(choice: Bool) {
        // do nothing - always veggie
    }
    
    override func setBacon(choice: Bool) {
        fatalError("Cannot add bacon to this burger")
    }
}
