//
//  NewTransactionView.swift
//  CarlBank
//
//  Created by Andrew Chai on 3/7/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class NewTransactionView: UIView {
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UILabel!
    @IBOutlet var ringViews: [UIView]!
    
    fileprivate var selectedIndex = 0
    
    var amount: Float? {
        guard let text = amountTextField.text else { return nil }
        return Float(text)
    }
    
    var transactionDescription: String? {
        return descriptionTextField.text
    }
    
    
}
