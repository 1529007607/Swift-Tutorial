//
//  Proxy.swift
//  The Proxy Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

protocol HttpHeaderRequest {
    func getHeader(_ url: String, _ header: String) -> String?
}

class HttpHeaderRequestProxy: HttpHeaderRequest {
    private let queue = DispatchQueue(label: "httpQ", qos: .utility, attributes: .initiallyInactive, autoreleaseFrequency: .workItem)
    private let semaphore = DispatchSemaphore(value: 0)
    private var cachedHeaders = [String: String]()
    
    func getHeader(_ urlStr: String, _ header: String) -> String? {
        var headerValue: String?
        
        queue.sync {
            if let cachedValue = self.cachedHeaders[header] {
                headerValue = "\(cachedValue) (cached)"
            } else {
                let url = URL(string: urlStr)!
                let request = URLRequest(url: url)
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let httpResponse = response as? HTTPURLResponse {
                        headerValue = httpResponse.allHeaderFields[header] as? String
                    }
                    self.semaphore.signal()
                    }.resume()
                _ = semaphore.wait(timeout: .distantFuture)
            }
        }
        return headerValue
    }
}
