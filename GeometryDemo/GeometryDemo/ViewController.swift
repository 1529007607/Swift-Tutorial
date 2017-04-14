//
//  ViewController.swift
//  GeometryDemo
//
//  Created by Andrew Chai on 3/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit
import GeometryLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let coordinate = Coordinate(x: 100, y: 100)
        print(coordinate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

