//
//  ViewController.swift
//  CLViewsTest
//
//  Created by Andrew Chai on 3/24/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit
import CLViews

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = ImageHelper.takeScreenshot(to: label)
        
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 80))
        view.addSubview(imageView)
        imageView.image = image
    }


}

