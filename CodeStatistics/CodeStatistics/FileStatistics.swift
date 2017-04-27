//
//  FileStatistics.swift
//  CodeStatistics
//
//  Created by Andrew Chai on 4/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

final class FileStatistics {
    typealias LineByLineReader = StreamReader
    private lazy var lineByLineReader: LineByLineReader? = {
        return LineByLineReader(path: self.path)
    }()
    
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
        do {
            let results = try fileManager.attributesOfItem(atPath: path)
            return results[FileAttributeKey.size] as! Double
        } catch {
            print(error)
        }
        return 0.0
    }
    
    var lineCountExcludeBlankLine: Int {
        precondition(lineByLineReader != nil, "Invoke load method before")
        var count = 0
        while let line = lineByLineReader!.nextLine() {
            if line.utf16.count == 0 {
                continue
            }
            count += 1
        }
        return count
    }
    
    var lineCount: Int {
        precondition(lineByLineReader != nil, "Invoke load method before")
        var count = 0
        while let _ = lineByLineReader!.nextLine() {
            count += 1
        }
        return count
    }
    
    func load() {
        lineByLineReader = LineByLineReader(path: self.path)
    }
    
    func reload() {
        trash()
        load()
    }
    
    func trash() {
        lineByLineReader?.close()
    }
}
