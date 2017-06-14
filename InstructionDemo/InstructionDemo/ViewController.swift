//
//  ViewController.swift
//  InstructionDemo
//
//  Created by Andrew Chai on 6/2/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.showInstruction)))
    }
    
    @objc private func showInstruction() {
        if let window = view.window {
            let instructionView = InstructionView()
            window.addSubview(instructionView)
            
            instructionView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
            instructionView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
            instructionView.leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
            instructionView.rightAnchor.constraint(equalTo: window.rightAnchor).isActive = true
        }
    }
    
    private func getInstructionView() -> UIView {
        let translucentView = getTranslucentView()
        return translucentView
    }
    
    private func getTranslucentView() -> UIView {
        let v = UIView()
        v.alpha = 0.5
        v.backgroundColor = .lightGray
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.addSublayer(getMaskLayer())
        return v
    }
    
    private func getMaskLayer() -> CALayer {
        let radius: CGFloat = 100
        let originalX: CGFloat = 100
        let originalY: CGFloat = 100
        let circlePath = UIBezierPath(roundedRect: CGRect(x: originalX, y: originalY, width: radius, height: radius), cornerRadius: radius)
        let maskLayer = CAShapeLayer()
        maskLayer.path = circlePath.cgPath
        maskLayer.fillColor = UIColor.red.cgColor
        return maskLayer
    }

}














