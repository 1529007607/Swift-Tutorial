//
//  ProfileViewModel.swift
//  TheMVVMPattern
//
//  Created by Andrew Chai on 5/31/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class ProfileViewModel {
    let profile: Profile
    
    // MARK - Initialization
    
    init(withProfile profile: Profile) {
        self.profile = profile
    }
    
    func timeForProfile() -> String {
        return string(from: profile.duration)
    }
    
    func timeForSegment(of type: SegmentType) -> String {
        guard let segment = profile.segment(of: type) else { return "00:00" }
        return string(from: segment.duration)
    }
    
    func segmentOfTypeEnabled(_ type: SegmentType) -> Bool {
        guard let segment = profile.segment(of: type) else { return false }
        return segment.enabled
    }
    
    func setSegment(of type: SegmentType, enabled: Bool) {
        if let segment = profile.segment(of: type) {
            // Configure Segment
            segment.enabled = enabled
        } else {
            // Create Segment
            let segment = Segment(type: type)
            
            // Configure Segment
            segment.enabled = enabled
            
            // Add Segment to Profile
            profile.segments.append(segment)
        }
    }
    
    func numberOfRows(for type: SegmentType) -> Int {
        var result = 1
        guard let segment = profile.segment(of: type) else { return result }
        
        switch type {
        case .warmUp:
            result = segment.enabled ? 2 : 1
        case .coolDown:
            if segment.enabled {
                result = segment.sound(of: .begin) != nil ? 4 : 3
            }
        default:
            result = 1
        }
        return result
    }
    
    private func string(from timeInterval: TimeInterval) -> String {
        let timeInterval = Int(timeInterval)
        
        let hours = timeInterval / 3600
        let seconds = timeInterval % 60
        let minutes = ((timeInterval / 60) % 60)
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
