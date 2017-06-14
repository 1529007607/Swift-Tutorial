//
//  UIView+Constraints.swift
//  AnimatingCheckMark
//
//  Created by Andrew Chai on 6/13/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

extension UIView {
    func fullFillSuperview(with superview: UIView) {
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
    }
}
