//
//  ViewController.swift
//  TestDemo
//
//  Created by Andrew Chai on 3/10/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let queue = DispatchQueue.init(label: "com.TestDemo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        queue.async {
            NSLog("%@", Thread.current)
        }
        
        DispatchQueue.global().async {
            NSLog("%@", Thread.current)
        }
        
        DispatchQueue.main.async {
            NSLog("%@", Thread.current)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

