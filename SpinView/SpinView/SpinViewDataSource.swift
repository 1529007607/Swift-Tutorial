//
//  File.swift
//  SpinView
//
//  Created by Andrew Chai on 3/7/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class SpinViewDataSource: NSObject {
    var values: [Int]
    
    init(values: [Int]) {
        self.values = values
    }
}

extension SpinViewDataSource: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
}
