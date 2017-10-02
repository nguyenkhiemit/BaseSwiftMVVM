//
//  MenuCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/29/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol MenuCoordinatorType: class {
    func openLoginScreen()
}

final class MenuCoordinator: BaseCoordinator, MenuCoordinatorType {
    
    func open() -> MenuViewController {
        let viewModel = MenuViewModel()
        viewModel.navigationCoordinator = self
        let menuStoryBoard: UIStoryboard = UIStoryboard(name: "Menu", bundle: nil)
        let menuController = menuStoryBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        navigationController = menuController.navigationController
        menuController.viewModel = viewModel
        return menuController
    }
    
    func openLoginScreen() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.start()
    }
    
}
