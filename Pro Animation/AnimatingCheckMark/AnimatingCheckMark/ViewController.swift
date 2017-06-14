//
//  ViewController.swift
//  AnimatingCheckMark
//
//  Created by Andrew Chai on 6/13/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let holderView = HolderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimating()
    }

    private func startAnimating() {
        holderView.animate()
    }
    
    private func setupAnimation() {
        view.addSubview(holderView)
        
    }
}

