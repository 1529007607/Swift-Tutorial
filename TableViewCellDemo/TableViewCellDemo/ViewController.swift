//
//  ViewController.swift
//  TableViewCellDemo
//
//  Created by Andrew Chai on 3/30/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var clickedButtons: [Bool] = Array<Bool>(repeating: false, count: 5)
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clickedButtons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.isclicked = clickedButtons[indexPath.row]
        weak var wself = self
        cell.callback = { b in
            wself?.clickedButtons[indexPath.row] = b
        }
        return cell
    }

}
