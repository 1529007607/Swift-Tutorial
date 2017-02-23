//
//  PetDetailViewController.swift
//  DogsCats
//
//  Created by Andrew Chai on 2/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class PetDetailViewController: UIViewController {
    
    var pet: Pet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        title = pet?.name
    }
    
}
