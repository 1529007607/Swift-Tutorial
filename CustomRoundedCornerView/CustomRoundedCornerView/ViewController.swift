//
//  ViewController.swift
//  CustomRoundedCornerView
//
//  Created by Andrew Chai on 3/20/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var customRoundedCornerView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customRoundedCornerView = UILabel()
        view.addSubview(customRoundedCornerView)
        customRoundedCornerView.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        customRoundedCornerView.backgroundColor = UIColor.blue
        
        let maskPath = UIBezierPath(roundedRect: customRoundedCornerView.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        customRoundedCornerView.layer.mask = maskLayer
        
    }

}

