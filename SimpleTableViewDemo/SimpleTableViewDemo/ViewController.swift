//
//  ViewController.swift
//  SimpleTableViewDemo
//
//  Created by Andrew Chai on 4/14/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var datas: [Bool] = Array<Bool>(repeating: false, count: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        datas[indexPath.row] = !datas[indexPath.row]
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if datas[indexPath.row] {
            cell.contentView.backgroundColor = UIColor.red
        } else {
            cell.contentView.backgroundColor = UIColor.green
        }
        return cell
    }
}
