//
//  ConcreteResource.swift
//  NetworkRequestsDemo
//
//  Created by Andrew Chai on 6/14/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

struct QuestionResource: ApiResource {
    let methodPath = "/questions"
    
    func makeModel(serialization: Serialization) -> Question {
        return Question(serialization: serialization)
    }
}
