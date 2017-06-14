//
//  ViewController.swift
//  LiterallyImageAndColor
//
//  Created by Andrew Chai on 6/5/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = #imageLiteral(resourceName: "arcSelect-50")
        let color = #colorLiteral(red: 0.9086670876, green: 0.908688426, blue: 0.9086769819, alpha: 0.65)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

