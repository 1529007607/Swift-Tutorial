//
//  ViewController.swift
//  TestDemo
//
//  Created by Andrew Chai on 3/10/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let str = "#Hello#, play#gr#ound"
        let arr = str.components(separatedBy: "#")
        let attrsStr = NSMutableAttributedString(string: str)
        var index = 0
        for (i, s) in arr.enumerated() {
            var attrs = [String: Any]()
            if i % 2 == 0 {
                
            } else {
                attrs[NSForegroundColorAttributeName] = UIColor.red
            }
            let range = NSRange(location: index, length: s.characters.count)
            attrsStr.addAttributes(attrs, range: range)
            index += s.characters.count + 1
        }
        
        label.attributedText = attrsStr
        return label
    }()
    
    func setupViews() {
        view.addSubview(label)
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": label]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": label]))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupViews()
        setupConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

