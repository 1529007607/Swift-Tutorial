//
//  Adapter.swift
//  The Adapter Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

extension NewCoDirectory: EmployeeDataSource {
    var employees: [Employee] {
        return getStaff().values.map({ (sv) -> Employee in
            return Employee(name: sv.getName(), title: sv.getJob())
        })
    }
    
    func searchByName(name: String) -> [Employee] {
        return createEmployees(filter: { (sv: NewCoStaffMember) -> Bool in
            return sv.getName().range(of: name) != nil
        })
    }
    
    func searchByTitle(title: String) -> [Employee] {
        return createEmployees(filter: { (sv: NewCoStaffMember) -> Bool in
            return sv.getJob().range(of: title) != nil
        })
    }
    
    private func createEmployees(filter filterClosure: (NewCoStaffMember) -> Bool) -> [Employee] {
        return getStaff().values.filter(filterClosure).map { entry -> Employee in
            return Employee(name: entry.getName(), title: entry.getJob())
        }
    }
}
