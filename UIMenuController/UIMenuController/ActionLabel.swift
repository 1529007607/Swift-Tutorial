//
//  ActionLabel.swift
//  UIMenuController
//
//  Created by Andrew Chai on 2/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ActionLabel: UILabel {
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return (action == #selector(UIResponderStandardEditActions.copy(_:)))
    }
    
    // MARK: - UIResponderStandardEditActions
    
    override func copy(_ sender: Any?) {
        UIPasteboard.general.string = text
    }
}
