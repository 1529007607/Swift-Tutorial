//
//  AnimationMaskView.swift
//  AnimationMask
//
//  Created by Andrew Chai on 6/12/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

protocol AnimationMaskView {
    func startAnimation()
    func stopAnimation()
    
    func pause()
    func resume()
}
