//
//  SearchTool.swift
//  The Adapter Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class SearchTool {
    enum SearchType {
        case name
        case title
    }
    
    private let sources: [EmployeeDataSource]
    
    init(dataSources: EmployeeDataSource...) {
        self.sources = dataSources
    }
    
    var employees: [Employee] {
        var results = [Employee]()
        for source in sources {
            results += source.employees
        }
        return results
    }
    
    func search(text: String, type: SearchType) -> [Employee] {
        var results = [Employee]()
        for source in sources {
            if type == .name {
                results += source.searchByName(name: text)
            } else {
                results += source.searchByTitle(title: text)
            }
        }
        return results
    }
}
