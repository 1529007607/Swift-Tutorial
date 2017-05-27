//
//  Cells.swift
//  SportsStore
//
//  Created by Andrew Chai on 5/16/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ProductTableCell: DatasourceCell {
    
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
        stepper.addTarget(self, action: #selector(ProductTableCell.stepperValueDidChange(sender:)), for: .touchDown)
        
        return stepper
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(ProductTableCell.stepperValueDidChange(sender:)), for: .touchDown)
        return button
    }()
    
    let stockField: UITextField = {
        let textField = UITextField()
        textField.text = "Default stock"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    func handleStepperTap(sender: AnyObject) {
        print("ok")
    }
    
    func stepperValueDidChange(sender: AnyObject) {
        print("ok")
    }
    
    func setupSubViews() {
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(stockStepper)
        addSubview(stockField)
        addSubview(button)
        
        bringSubview(toFront: button)
        
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        descriptionLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        stockStepper.anchorCenterYToSuperview()
        stockStepper.rightAnchor.constraint(equalTo: stockField.leftAnchor).isActive = true
        stockField.anchorCenterYToSuperview()
        stockField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stockField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.anchorCenterSuperview()
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
