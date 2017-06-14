//
//  AbstractAPIResources.swift
//  NetworkRequestsDemo
//
//  Created by Andrew Chai on 6/14/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

/// Reusing code by abstracting API resources with protocols, generics, and extensions
protocol ApiResource {
    associatedtype Model
    var methodPath: String { get }
    func makeModel(serialization: Serialization) -> Model
}

extension ApiResource {
    var url: URL {
        let baseUrl = "https://www.baidu.com"
        let site = "site=stackoverflow"
        let order = "order=desc"
        let sorting = "sort=votes"
        let tags = "tagged=ios"
        let url = baseUrl + methodPath + "?" + order + "&" + sorting + "&" + tags + "&" + site
        return URL(string: url)!
    }
    
    func makeModel(data: Data) -> [Model]? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else { return nil }
        guard let jsonSerialization = json as? Serialization else { return nil }
        let wrapper = ApiWrapper(serialization: jsonSerialization)
        return wrapper.items.map(makeModel(serialization:))
    }
}

















