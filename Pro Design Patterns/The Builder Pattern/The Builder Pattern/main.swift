//
//  main.swift
//  The Builder Pattern
//
//  Created by Andrew Chai on 5/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

var builder = BurgerBuilder.getBuilder(burgerType: .bigBurger)

let name = "Joe"

builder.setMayo(choice: false)
builder.setCooked(choice: Burger.Cooked.wellDone)

let order = builder.buildObject(name: name)

order.printDescription()

