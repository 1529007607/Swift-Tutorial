//
//  Layers.swift
//  AnimatingCheckMark
//
//  Created by Andrew Chai on 6/13/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class OvalLayer: CAShapeLayer {
    
    let animationDuration: CFTimeInterval = 1
    
    weak var holder: HolderView?
    
    func expand() {
        guard let holder = holder else { return }
        
        let expandAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = holder.ovalPathSmall
        expandAnimation.toValue = holder.ovalPathLarge
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        add(expandAnimation, forKey: nil)
    }
}
