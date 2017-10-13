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

enum MenuIndex {
    case POS_HOME
    case POS_LOGIN_TITLE
    case POS_LOGIN
    case POS_ABOUT_TITLE
    case POS_LANGUAGE
    case POS_ABOUT
}

struct Menu {
    var index: MenuIndex? = .POS_HOME
    var text: String? = ""
    var type: MenuType? = .MENU
    
    init(index: MenuIndex, text: String, type: MenuType) {
        self.index = index
        self.text = text
        self.type = type
    }
}
