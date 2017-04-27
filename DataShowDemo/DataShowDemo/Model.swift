//
//  Model.swift
//  DataShowDemo
//
//  Created by Andrew Chai on 4/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

struct Model {
    let type: String
    let term: String
    let title: String
    let teachMode: String
    let time: String
    let from: String
    let score: String
    
    var toDataSource: [(String, String)] {
        return [("学分类型", type),
        ("学年学期", term),
        ("课程名称", title),
        ("授课方式", teachMode),
        ("获得时间", time),
        ("学分来源", from),
        ("获得学分", score)
        ]
    }
    
    var number: Int {
        return toDataSource.count
    }
}
