//
//  ImageHelperTests.swift
//  CLViews
//
//  Created by Andrew Chai on 3/29/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import XCTest
@testable import CLViews

class ImageHelperTests: XCTestCase {
    
    func testTakeScreenshotToView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let image = ImageHelper.takeScreenshot(to: view)
        XCTAssertNotNil(image)
    }
    
    func testTakeScreenshotToLayer() {
        let layer = CALayer()
        let image = ImageHelper.takeScreenshot(to: layer)
        XCTAssertNotNil(image)
    }
    
    func testTakeScreenshotToPath() {
        let path = CGMutablePath()
        let image = ImageHelper.takeScreenshot(to: path)
        XCTAssertNotNil(image)
    }
}
