//
//  Segment.swift
//  TheMVVMPattern
//
//  Created by Andrew Chai on 5/31/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

enum SegmentType {
    case main
    case warmUp
    case coolDown
}

class Segment {
    var enabled: Bool
    var type: SegmentType
    var sounds = [Sound]()
    var duration: Double = 300
    
    init(type: SegmentType) {
        self.type = type
        self.enabled = true
    }
    
    func sound(of type: SoundType) -> Sound? {
        var result: Sound? = nil
        for sound in sounds {
            if sound.type == type {
                result = sound
            }
        }
        return result
    }
}
