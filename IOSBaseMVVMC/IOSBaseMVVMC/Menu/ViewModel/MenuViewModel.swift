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
    
    fileprivate let disposeBag = DisposeBag()
    
    lazy var arrayMenu: Variable<[Menu]> = {
        return self.createData()
    }()
    
//    var newScreenSubject = PublishSubject<Menu>()
    
    var t: Int = 0
    
    init() {
//        newScreenSubject
//            .asObservable()
//            .subscribe(onNext: {
//                [unowned self] in
//                print("\($0)")
//                self.openNewScreen(index: $0.index!)
//            })
//            .disposed(by: disposeBag)
    }
}

extension MenuViewModel {
    fileprivate func createData() -> Variable<[Menu]> {
        let menus = Variable<[Menu]>([])
        menus.value.append(Menu(index: MenuIndex.POS_HOME.rawValue, text: "Home".localized(), type: MenuType.MENU))
        menus.value.append(Menu(index: MenuIndex.POS_LOGIN_TITLE.rawValue, text: "Title Login".localized(), type: MenuType.TITLE))
        menus.value.append(Menu(index: MenuIndex.POS_LOGIN.rawValue, text: "Login".localized(), type: MenuType.MENU))
        menus.value.append(Menu(index: MenuIndex.POS_ABOUT_TITLE.rawValue, text: "Title About Me".localized(), type: MenuType.TITLE))
        menus.value.append(Menu(index: MenuIndex.POS_ABOUT.rawValue, text: "About Me".localized(), type: MenuType.MENU))
        return menus
    }

}
