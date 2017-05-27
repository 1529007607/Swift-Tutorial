//
//  Employees.swift
//  The Adapter Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

struct Employee {
    var name: String
    var title: String
}

protocol EmployeeDataSource {
    var employees: [Employee] { get }
    func searchByName(name: String) -> [Employee]
    func searchByTitle(title: String) -> [Employee]
}
