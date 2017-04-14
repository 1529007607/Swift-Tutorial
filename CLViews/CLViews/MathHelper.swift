//
//  MathHelper.swift
//  CLViews
//
//  Created by Andrew Chai on 3/29/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

public func degree2radian(a: CGFloat) -> CGFloat {
    let b = CGFloat(Double.pi) * a / 180
    return b
}

public func radian2degree(a: CGFloat) -> CGFloat {
    let b = 180 / CGFloat(Double.pi) * a
    return b
}
