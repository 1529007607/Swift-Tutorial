//
//  SpinViewDelegate.swift
//  SpinView
//
//  Created by Andrew Chai on 3/7/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class SpinViewDelegate: NSObject {
    var values: [Int]
    
    init(values: [Int]) {
        self.values = values
    }
}

extension SpinViewDelegate: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(values[row])
    }
}
