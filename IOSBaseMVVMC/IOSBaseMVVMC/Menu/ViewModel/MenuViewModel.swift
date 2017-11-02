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
    
    fileprivate let disposeBag = DisposeBag()
    
    lazy var arrayMenu: Variable<[Menu]> = {
        return self.createData()
    }()
    
    init() {
    }
}

extension MenuViewModel {
    fileprivate func createData() -> Variable<[Menu]> {
        let menus = Variable<[Menu]>([])
        menus.value.append(Menu(index: MenuIndex.POS_HOME, text: "Home".localized(), type: MenuType.MENU))
        menus.value.append(Menu(index: MenuIndex.POS_LOGIN_TITLE, text: "Title Login".localized(), type: MenuType.TITLE))
        menus.value.append(Menu(index: MenuIndex.POS_LOGIN, text: "Login".localized(), type: MenuType.MENU))
        menus.value.append(Menu(index: MenuIndex.POS_LANGUAGE, text: "Language".localized(), type: MenuType.MENU))
        menus.value.append(Menu(index: MenuIndex.POS_ABOUT_TITLE, text: "Title TabLayout".localized(), type: MenuType.TITLE))
        menus.value.append(Menu(index: MenuIndex.POS_TAB_LAYOUT, text: "About TabLayout".localized(), type: MenuType.MENU))
        return menus
    }

}
