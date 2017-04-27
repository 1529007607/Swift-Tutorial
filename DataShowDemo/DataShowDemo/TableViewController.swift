//
//  TableViewController.swift
//  DataShowDemo
//
//  Created by Andrew Chai on 4/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var dataSource: [(String, String)]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = Model(type: "必修", term: "上学期", title: "组织与实施", teachMode: "网售", time: "12", from: "培训", score: "2").toDataSource
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        let temp = dataSource [indexPath.row]
        cell.textLabel?.text = temp.0
        cell.detailTextLabel?.text = temp.1
        return cell
    }
}
