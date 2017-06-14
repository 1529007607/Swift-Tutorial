//
//  AnimationMaskDefaultView.swift
//  AnimationMask
//
//  Created by Andrew Chai on 6/12/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class AnimationMaskDefaultView: UIView {
    
    lazy var maskLayer: CALayer = {
        var maskLayer = CALayer()
        maskLayer.bounds = self.bounds
        maskLayer.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        maskLayer.backgroundColor = UIColor.yellow.cgColor
        return maskLayer
    }()
    
    override func willMove(toSuperview newSuperview: UIView?) {
        startAnimation()
    }
    
}

extension AnimationMaskDefaultView: CAAnimationDelegate {
}

extension AnimationMaskDefaultView: AnimationMaskView {
    func startAnimation() {
        self.layer.addSublayer(maskLayer)
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        CATransaction.setAnimationDuration(1.5)
        
        let widthAnimation = CABasicAnimation(keyPath: "bounds.size.width")
        widthAnimation.fromValue = bounds.width
        widthAnimation.toValue = 0
        
        let positionXAnimation = CABasicAnimation(keyPath: "position.x")
        positionXAnimation.fromValue = bounds.width / 2
        positionXAnimation.toValue = bounds.width
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [widthAnimation, positionXAnimation]
        maskLayer.add(animationGroup, forKey: "moveAway")
        
        CATransaction.setCompletionBlock {
            
            print("ok")
        }
        
        CATransaction.commit()
    }
    
    func stopAnimation() {
        
    }
    
    func pause() {
        
    }
    
    func resume() {
        
    }
}
