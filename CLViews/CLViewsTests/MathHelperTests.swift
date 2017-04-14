//
//  MathHelperTests.swift
//  CLViews
//
//  Created by Andrew Chai on 3/29/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import XCTest
@testable import CLViews

class MathHelperTests: XCTestCase {
    func testDegree2radian() {
        let nintyRadian = degree2radian(a: 90)
        XCTAssertEqualWithAccuracy(1.5708, nintyRadian, accuracy: 0.001)
    }
    
    func testRadian2degree() {
        let nintyDegree = radian2degree(a: 1.5708)
        XCTAssertEqualWithAccuracy(90, nintyDegree, accuracy: 0.001)
    }
}
