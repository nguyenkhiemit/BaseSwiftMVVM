//
//  MenuCell.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/30/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {
    
    static var Identifier = "MenuViewCell"

    @IBOutlet weak var menuViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(menu: Menu) {
        menuViewLabel.text = menu.text
    }

}
