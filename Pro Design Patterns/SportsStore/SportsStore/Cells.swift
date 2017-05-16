//
//  Cells.swift
//  SportsStore
//
//  Created by Andrew Chai on 5/16/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ProductTableCell: UITableViewCell {
    
    var productId: Int?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Default name"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Default Description"
        return label
    }()
    
    let stockStepper: UIStepper = {
        let stepper = UIStepper()
        return stepper
    }()
    
    let stockField: UITextField = {
        let textField = UITextField()
        textField.text = "Default stock"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    func setupSubViews() {
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(stockStepper)
        addSubview(stockField)
        
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        descriptionLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        stockStepper.anchorCenterYToSuperview()
        stockStepper.rightAnchor.constraint(equalTo: stockField.leftAnchor).isActive = true
        stockField.anchorCenterYToSuperview()
        stockField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stockField.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
