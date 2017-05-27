//
//  ContainerView.swift
//  TestDemo
//
//  Created by Andrew Chai on 5/17/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ContainerView: UIView {
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.addTarget(self, action: #selector(ContainerView.stepperValueDidChange(sender:)), for: .valueChanged)
        return stepper
    }()
    
    func stepperValueDidChange(sender: AnyObject) {
        print("ok")
    }
    
    func setupViews() {
        addSubview(stepper)
        stepper.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stepper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
