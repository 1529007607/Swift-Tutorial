//
//  SelectColorViewController.swift
//  UISplitViewController
//
//  Created by Andrew Chai on 2/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

extension SelectColorViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = cellTitles[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "rowSelect", sender: colors[indexPath.row])
    }
}

class SelectColorViewController: UITableViewController {
    
    let identifier = "ColorCell"
    let colors: [UIColor] = [UIColor.red,
                             UIColor.blue,
                             UIColor.brown,
                             UIColor.cyan,
                             UIColor.darkText,
                             UIColor.darkGray,
                             UIColor.green,
                             UIColor.magenta,
                             UIColor.orange]
    
    let cellTitles: [String] = ["red",
                                "blue",
                                "brown",
                                "cyan",
                                "darkText",
                                "darkGray",
                                "green",
                                "magenta",
                                "orange"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        (dest.childViewControllers[0] as! ColorViewController).color = sender as? UIColor
    }
}
