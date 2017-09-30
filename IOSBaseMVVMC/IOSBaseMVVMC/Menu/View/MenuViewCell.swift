//
//  MenuCell.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/30/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {

    @IBOutlet weak var menuViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(menu: Menu) {
        menuViewLabel.text = menu.text
    }

}
