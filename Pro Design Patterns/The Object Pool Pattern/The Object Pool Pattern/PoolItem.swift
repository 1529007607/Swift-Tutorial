//
//  PoolItem.swift
//  The Object Pool Pattern
//
//  Created by Andrew Chai on 5/20/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

protocol PoolItem {
    var canReuse: Bool { get }
}
