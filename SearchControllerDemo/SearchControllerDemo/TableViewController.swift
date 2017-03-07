//
//  TableViewController.swift
//  SearchControllerDemo
//
//  Created by Andrew Chai on 2/28/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

extension TableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

class TableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
}
