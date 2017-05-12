//
//  CodeStatistics.swift
//  CodeStatistics
//
//  Created by Andrew Chai on 4/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

protocol CodeStatistics {
    var fileManager: FileManager { get }
    var path: String { get set }
    var size: Double { get }
    var lineCountExcludeBlankLine: Int { get }
    var lineCount: Int { get }
}

protocol CodeStatisticsLifeCycle {
    func load()
    func reload()
    func trash()
}
