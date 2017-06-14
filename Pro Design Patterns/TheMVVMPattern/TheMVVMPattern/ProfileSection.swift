//
//  ProfileSection.swift
//  TheMVVMPattern
//
//  Created by Andrew Chai on 5/31/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

enum ProfileSection: Int {
    case time, warmUp, coolDown, countValue
    
    static var count = {
        return ProfileSection.countValue.rawValue
    }()
    
    static let sectionTitles = [
        time: "Time",
        warmUp: "Warm Up",
        coolDown: "Cool Down"
    ]
    
    func sectionTitle() -> String {
        if let sectionTitle = ProfileSection.sectionTitles[self] {
            return sectionTitle
        } else {
            return ""
        }
    }
}
