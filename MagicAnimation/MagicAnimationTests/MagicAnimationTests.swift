//
//  MagicAnimationTests.swift
//  MagicAnimationTests
//
//  Created by Andrew Chai on 2/24/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import XCTest
@testable import MagicAnimation

class MagicAnimationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCircleDoublyLinkedList() {
        let circle = CircleDoublyLinkedList<Int>()
        circle.append(value: 0)
        circle.append(value: 1)
        circle.append(value: 2)
    }
    
    func testLinkedList() {
        let dogBreeds = LinkedList<Int>()
        dogBreeds.append(value: 1)
        dogBreeds.append(value: 2)
        dogBreeds.append(value: 3)
    }
}
