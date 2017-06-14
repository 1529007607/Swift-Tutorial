//
//  Models.swift
//  NetworkRequestsDemo
//
//  Created by Andrew Chai on 6/14/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

/// Creating model types that match the entities of a REST API
struct Question {
    let title: String
    let score: Int
    let tags: [String]
    let date: Date
    let owner: User?
}

struct User {
    let name: String?
    let profileImageURL: URL?
    let reputation: Int?
}

struct ApiWrapper {
    let items: [Serialization]
}
