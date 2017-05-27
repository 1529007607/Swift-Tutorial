//
//  ProductDataSource.swift
//  SportsStore
//
//  Created by Andrew Chai on 5/18/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class ProductDataSource: Datasource {
    override var objects: [Any]? {
        
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [ProductTableCell.self]
    }
}
