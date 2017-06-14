//
//  Sound.swift
//  TheMVVMPattern
//
//  Created by Andrew Chai on 5/31/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

enum SoundType {
    case repeatAble
    case begin
    case end
}

class Sound {
    var enabled: Bool
    var type: SoundType
    var name: String = ""
    var iterations: Int = 0
    var timeInterval: Double = 300
    
    // MARK - Initialization
    
    init(type: SoundType) {
        self.type = type
        self.enabled = true
    }
}
