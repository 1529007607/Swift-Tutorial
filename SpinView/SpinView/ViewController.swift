//
//  ViewController.swift
//  SpinView
//
//  Created by Andrew Chai on 3/7/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let initializationData = [1, 2, 3, 4, 5, 6]
    
    @IBOutlet weak var spinView: UIPickerView!
    
    var dataSource: SpinViewDataSource!
    var delegate: SpinViewDelegate!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataSource = SpinViewDataSource(values: initializationData)
        delegate = SpinViewDelegate(values: initializationData)
        spinView.dataSource = dataSource
        spinView.delegate = delegate
        spinView.reloadAllComponents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

