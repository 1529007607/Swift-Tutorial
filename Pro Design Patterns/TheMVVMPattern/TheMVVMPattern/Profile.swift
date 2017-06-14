//
//  Profile.swift
//  TheMVVMPattern
//
//  Created by Andrew Chai on 5/31/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class Profile {
    var name = "Profile"
    var segments = [Segment]()
    var duration: TimeInterval = 450.0
    
    init() {
        // Create Main Segment
        let segment = Segment(type: .main)
        // Add Segment to Profile
        self.segments.append(segment)
    }
    
    func segment(of type: SegmentType) -> Segment? {
        var result: Segment? = nil
        for segment in segments {
            if segment.type == type {
                result = segment
            }
        }
        return result
    }
}
