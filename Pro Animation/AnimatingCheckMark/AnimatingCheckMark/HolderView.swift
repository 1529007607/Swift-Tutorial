//
//  LoadingView.swift
//  AnimatingCheckMark
//
//  Created by Andrew Chai on 6/13/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class HolderView: UIView {
    let ovalLayer = OvalLayer()
    
    lazy var ovalPathSmall: UIBezierPath = UIBezierPath(ovalIn: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    lazy var ovalPathLarge: UIBezierPath = UIBezierPath(ovalIn: CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100)))
    
    override func didMoveToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.groupTableViewBackground
        if let superview = superview {
            setupConstraints(withParent: superview)
            setupLayers()
        }
    }
    
    private func setupConstraints(withParent superview: UIView) {
        fullFillSuperview(with: superview)
    }
    
    private func setupLayers() {
        setupOvalLayer()
    }
    
    private func setupOvalLayer() {
        ovalLayer.path = ovalPathLarge.cgPath
        ovalLayer.bounds = bounds
        ovalLayer.position = center
        ovalLayer.fillColor = nil
        ovalLayer.strokeColor = UIColor.red.cgColor
        ovalLayer.holder = self
    }
    
    func animate() {
        layer.addSublayer(ovalLayer)
//        ovalLayer.expand()
    }
}
