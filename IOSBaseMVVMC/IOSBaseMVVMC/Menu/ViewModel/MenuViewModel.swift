//
//  MenuViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/30/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MenuViewModel {
    
    enum MenuIndex: Int {
        case POS_HOME = 0
        case POS_LOGIN_TITLE
        case POS_LOGIN
        case POS_ABOUT_TITLE
        case POS_ABOUT
    }
    
    lazy var arrayMenu: Driver<[Menu]> = {
        return self.createData()
    }()
}

extension MenuViewModel {
    fileprivate func createData() -> Driver<[Menu]> {
        let menus = Variable<[Menu]>([])
        menus.value.append(Menu(index: MenuIndex.POS_HOME.rawValue, text: "Home".localized(), type: MenuType.MENU))
        menus.value.append(Menu(index: MenuIndex.POS_LOGIN_TITLE.rawValue, text: "Title Login".localized(), type: MenuType.TITLE))
        menus.value.append(Menu(index: MenuIndex.POS_LOGIN.rawValue, text: "Login".localized(), type: MenuType.MENU))
        menus.value.append(Menu(index: MenuIndex.POS_ABOUT_TITLE.rawValue, text: "Title About Me".localized(), type: MenuType.TITLE))
        menus.value.append(Menu(index: MenuIndex.POS_ABOUT.rawValue, text: "About Me".localized(), type: MenuType.MENU))
        return menus.asDriver()
    }

}
