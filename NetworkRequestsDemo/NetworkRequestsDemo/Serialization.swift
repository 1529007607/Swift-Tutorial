//
//  Serialization.swift
//  NetworkRequestsDemo
//
//  Created by Andrew Chai on 6/14/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

/// Model types are responsible for transforming the JSON data that comes from an API
typealias Serialization = [String: Any]

protocol SerializationKey {
    var stringValue: String { get }
}

extension RawRepresentable where RawValue == String {
    var stringValue: String {
        return rawValue
    }
}

protocol SerializationValue {}

extension Bool: SerializationValue {}
extension String: SerializationValue {}
extension Int: SerializationValue {}
extension Dictionary: SerializationValue {}
extension Array: SerializationValue {}

extension Dictionary where Key == String, Value: Any {
    func value<V: SerializationValue>(forKey key: SerializationKey) -> V? {
        return self[key.stringValue] as? V
    }
}

extension User {
    private enum Keys: String, SerializationKey {
        case reputation
        case name = "display_name"
        case profileImage = "profile_image"
    }
    
    init(serialization: Serialization) {
        name = serialization.value(forKey: Keys.name)
        reputation = serialization.value(forKey: Keys.reputation)
        if let url: String = serialization.value(forKey: Keys.profileImage) {
            profileImageURL = URL(string: url)
        } else {
            profileImageURL = nil
        }
    }
}

extension Question {
    private enum Keys: String, SerializationKey {
        case title
        case score
        case tags
        case owner
        case date = "creation_date"
    }
    
    init(serialization: Serialization) {
        title = serialization.value(forKey: Keys.title)!
        score = serialization.value(forKey: Keys.score)!
        tags = serialization.value(forKey: Keys.tags)!
        let creationdate: Int = serialization.value(forKey: Keys.date)!
        date = Date(timeIntervalSince1970: TimeInterval(creationdate))
        if let ownerSerialization: Serialization = serialization.value(forKey: Keys.owner) {
            owner = User(serialization: ownerSerialization)
        } else {
            owner = nil
        }
    }
}

extension ApiWrapper {
    private enum Keys: String, SerializationKey {
        case items
    }
    
    init(serialization: Serialization) {
        items = serialization.value(forKey: Keys.items) ?? []
    }
}













