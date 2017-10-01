//
//  TitleMenuTableViewCell.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class TitleMenuTableViewCell: UITableViewCell {
    
    static var Identifier = "TitleMenuTableViewCell"
    
    @IBOutlet weak var titleMenuTableViewLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(menu: Menu) {
        titleMenuTableViewLabel.text = menu.text
    }

}
