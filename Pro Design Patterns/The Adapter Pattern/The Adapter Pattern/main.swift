//
//  main.swift
//  The Adapter Pattern
//
//  Created by Andrew Chai on 5/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

let search = SearchTool(dataSources: SalesDataSource(), DevelopmentDataSource(), NewCoDirectory())

print("--List--")
for e in search.employees {
    print("Name: \(e.name)")
}

print("--Search--")
for e in search.search(text: "VP", type: .title) {
    print("Name: \(e.name), Title: \(e.title)")
}

