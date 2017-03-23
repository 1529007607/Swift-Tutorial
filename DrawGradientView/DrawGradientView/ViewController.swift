//
//  ViewController.swift
//  DrawGradientView
//
//  Created by Andrew Chai on 3/17/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientView: UIView!
    
    var gradientLayer: CAGradientLayer!
    
    func createGradientLayer() {
        let x = gradientView.bounds.origin.x
        let y = gradientView.bounds.origin.y
        let _ = gradientView.bounds.size.width
        let height = gradientView.bounds.size.height
        
        let oneHalfLocation = NSNumber(value: Double(height / 2))
        let _ = NSNumber(value: Double(height / 4))
        let _ = NSNumber(value: Double(height / 4 * 3))
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.startPoint = CGPoint(x: x, y: y)
        gradientLayer.endPoint = CGPoint(x: x, y: y + height)
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [oneHalfLocation]
        gradientView.layer.addSublayer(gradientLayer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

