//
//  main.swift
//  The ModelViewController Pattern
//
//  Created by Andrew Chai on 5/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

let repository = MemoryRepository()
let controllerChain = PersonController(repo: repository, nextController: CityController(repo: repository, nextController: nil))

var stdIn = FileHandle.standardInput
var command = Command.listPeople
var data = [String]()

while true {
    if let view = controllerChain.handleCommand(command, data) {
        view.execute()
        print("--Commmands--")
        for command in Command.all {
            print(command.rawValue)
        }
    } else {
        fatalError("No view")
    }
    
    let input: String = String(data: stdIn.availableData, encoding: .utf8) ?? ""
    let inputArray: [String] = input.split()
    
    if inputArray.count > 0 {
        command = Command.getFromInput(inputArray.first!) ?? Command.listPeople
        if inputArray.count > 1 {
            data = Array(inputArray.suffix(inputArray.count - 1))
        } else {
            data = []
        }
    }
    print("Command \(command.rawValue) Data: \(data)")
}
















