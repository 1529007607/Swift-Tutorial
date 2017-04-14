//
//  TableViewCell.swift
//  TableViewCellDemo
//
//  Created by Andrew Chai on 3/30/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var btn: UIButton!
    
    var callback: ((Bool) -> Swift.Void)?
    var isclicked: Bool? {
        didSet {
            let title = isclicked! ? "3" : "0"
            btn.setTitle(title, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btn.addTarget(self, action: #selector(TableViewCell.buttonClicked(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonClicked(sender: UIButton) {
        isclicked = !(isclicked ?? false)
        callback?(isclicked!)
    }
}
