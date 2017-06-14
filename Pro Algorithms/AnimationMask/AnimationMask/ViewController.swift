//
//  ViewController.swift
//  AnimationMask
//
//  Created by Andrew Chai on 6/12/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var animationLayer: CALayer = {
        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        layer.position = self.view.center
        layer.backgroundColor = UIColor.cyan.cgColor
        layer.isOpaque = true
        
        return layer
    }()
    
    lazy var animationView: AnimationMaskDefaultView = {
        let v = AnimationMaskDefaultView(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
        v.backgroundColor = .red
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.setupAnimationView)))
    }
    
    @objc private func setupAnimationView() {
        if let _ = animationView.superview {
            animationView.startAnimation()
        } else {
            view.addSubview(animationView)
        }
    }
    
    @objc private func startAnimation() {
        view.layer.addSublayer(animationLayer)
        CATransaction.begin()
        CATransaction.setAnimationDuration(1)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        
        let animation = CABasicAnimation(keyPath: "bounds")
        animation.fromValue = CGRect(x: 0, y: 0, width: 0, height: 0)
        animation.toValue = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationLayer.add(animation, forKey: "grow")
        
        CATransaction.commit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupAnimationView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

