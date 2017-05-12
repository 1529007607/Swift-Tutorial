//
//  ProjectStatistics.swift
//  CodeStatistics
//
//  Created by Andrew Chai on 4/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

final class ProjectStatistics: CodeStatistics {
    var path: String {
        didSet {
            reload()
        }
    }
    
    init(path: String) {
        self.path = path
    }
    
    deinit {
        trash()
    }
    
    var fileManager: FileManager {
        return FileManager.default
    }
    
    var size: Double {
        return 0.0
    }
    
    var lineCountExcludeBlankLine: Int {
        return 0
    }
    
    var lineCount: Int {
        return 0
    }
}

extension ProjectStatistics: CodeStatisticsLifeCycle {
    func load() {
    }
    
    func reload() {
        trash()
        load()
    }
    
    func trash() {
    }
}
