//
//  main.swift
//  The Composite Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

let doorWindow = CompositePart(name: "DoorWindow", parts: Part(name: "Window", price: 100.50), Part(name: "Window Switch", price: 12))

let door = CompositePart(name: "Door", parts: doorWindow, Part(name: "Door Loom", price: 80), Part(name: "Door Handles", price: 43.40))

let hood = Part(name: "Hood", price: 320)

let order = CustomOrder(customer: "Bob", parts: [hood, door, doorWindow])
order.printDetails()
