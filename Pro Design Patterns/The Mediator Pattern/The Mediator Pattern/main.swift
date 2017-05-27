//
//  main.swift
//  The Mediator Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

let mediator = MessageMediator()

// initial setup
let british = Airplane(name: "BA706", initialPos: Position(distanceFromRunway: 11, height: 21000), mediator: mediator)

// new plane arrives
let american = Airplane(name: "AA101", initialPos: Position(distanceFromRunway: 12, height: 22000), mediator: mediator)

// plane approaches airport
british.changePosition(Position(distanceFromRunway: 8, height: 10000))
british.changePosition(Position(distanceFromRunway: 2, height: 5000))
british.changePosition(Position(distanceFromRunway: 1, height: 1000))

// new plane arrives
let cathay = Airplane(name: "CX200", initialPos: Position(distanceFromRunway: 13, height: 22000), mediator: mediator)

// plane lands
british.land()

// plane moves too close
cathay.changePosition(Position(distanceFromRunway: 12, height: 22000))

