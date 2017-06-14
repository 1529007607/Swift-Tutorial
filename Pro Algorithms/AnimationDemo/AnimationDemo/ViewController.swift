//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Andrew Chai on 6/3/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func stopAnimation() {
        av?.stopAnimation()
    }
    
    var av: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        av = AnimationView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        view.addSubview(av!)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.stopAnimation)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

