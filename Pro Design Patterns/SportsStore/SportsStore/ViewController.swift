//
//  ViewController.swift
//  SportsStore
//
//  Created by Andrew Chai on 5/16/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var products = [
        ("Kayak", "A boat for one person", "Watersports", 275.0, 10),
        ("Lifejacket", "Protective and fashionable", "Watersports", 48.95, 14),
        ("Soccer Ball", "FIFA-approved size and weight", "Soccer", 19.5, 32),
        ("Corner Flags", "Give your playing field a professional touch", "Soccer", 34.95, 1),
        ("Stadium", "Flat-packed 35,000-seat stadium", "Soccer", 79500.0, 4),
        ("Thinking Cap", "Improve your brain efficiency by 75%", "Chess", 16.0, 8),
        ("Unsteady Chair", "Secretly give your opponent a disadvantage", "Chess", 29.95, 3),
        ("Human Chess Board", "A fun game for the family", "Chess", 75.0, 2),
        ("Bling-Bling King", "Gold-plated, diamond-studded King", "Chess", 1200.0, 4)
    ]
    
    let cellId = "cellId"
    
    let totalStockLabel: UILabel = {
        let label = UILabel()
        label.text = "Default value"
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.backgroundColor = .white
        return table
    }()
    
    func displayStockTotal() {
        let stockTotal = products.reduce(0, {$0 + $1.4})
        totalStockLabel.text = "\(stockTotal) Products in Stock"
    }
    
    func setupViews() {
        view.addSubview(totalStockLabel)
        view.addSubview(tableView)
        tableView.register(ProductTableCell.self, forCellReuseIdentifier: cellId)

        totalStockLabel.anchor(tableView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        tableView.anchor(view.topAnchor, left: view.leftAnchor, bottom: totalStockLabel.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        displayStockTotal()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductTableCell
        cell.productId = indexPath.row
        cell.nameLabel.text = product.0
        cell.descriptionLabel.text = product.1
        cell.stockStepper.value = Double(product.4)
        cell.stockField.text = String(product.4)
        return cell
    }
}
