//
//  ColorViewController.swift
//  UISplitViewController
//
//  Created by Andrew Chai on 2/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? UIColor.groupTableViewBackground
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }
}
