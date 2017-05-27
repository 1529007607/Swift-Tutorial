//
//  NetworkConnection.swift
//  The Object Pool Pattern
//
//  Created by Andrew Chai on 5/20/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class NetworkConnection {
    private let stockData: [String: Int] = [
        "Kayak": 10, "Lifejecket": 14,
        "Soccer Ball": 32, "Corner Flags": 1,
        "Stadium": 4, "Thinking Cap": 8,
        "unsteady Chair": 3, "Human Chess Board": 2,
        "Bling-Bling King": 4]
    
    func getStockLevel(name: String) -> Int? {
        Thread.sleep(forTimeInterval: TimeInterval(arc4random() % 2))
        return stockData[name]
    }
}
