//
//  MenuCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/29/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

//protocol MenuCoordinatorType: class {
//    func openLoginScreen()
//}

final class MenuCoordinator {
    
    func open() -> MenuViewController {
        let viewModel = MenuViewModel()
        let menuStoryBoard: UIStoryboard = UIStoryboard(name: "Menu", bundle: nil)
        let menuController = menuStoryBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuController.viewModel = viewModel
        return menuController
    }
    
}
