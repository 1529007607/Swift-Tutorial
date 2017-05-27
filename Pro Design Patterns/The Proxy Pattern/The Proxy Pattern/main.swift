//
//  main.swift
//  The Proxy Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

let url = "https://www.baidu.com"
let headers = ["Content-Length", "Content-Encoding"]

let proxy = HttpHeaderRequestProxy()

for header in headers {
    if let val = proxy.getHeader(url, header) {
        print("\(header): \(val)")
    }
}

_ = FileHandle.standardInput.availableData
