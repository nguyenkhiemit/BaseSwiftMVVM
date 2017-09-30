//
//  Menu.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/29/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

enum MenuType {
    case TITLE
    case MENU
}

struct Menu {
    var index: Int? = 0
    var text: String? = ""
    var type: MenuType? = .MENU
    
    init(index: Int, text: String, type: MenuType) {
        self.index = index
        self.text = text
        self.type = type
    }
}
