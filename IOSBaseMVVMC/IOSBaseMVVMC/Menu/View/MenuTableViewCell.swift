//
//  MenuTableViewCell.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    static var Identifier = "MenuTableViewCell"
    
    @IBOutlet weak var menuTableViewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(menu: Menu) {
        menuTableViewLabel.text = menu.text
    }

}
