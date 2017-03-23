//
//  ViewController.swift
//  DrawSth
//
//  Created by Andrew Chai on 3/20/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(HeartView(frame: view.bounds))
        let fileM = FileManager.default.currentDirectoryPath
        print(fileM)
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        print(path ?? "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

