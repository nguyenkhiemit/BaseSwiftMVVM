//
//  HomeCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol HomeCoordinatorDelegate: class {
    func openNewScreen(index: Int)
}

final class HomeCoordinator: BaseCoordinator {
    
    override func start() {
        let viewModel = HomeViewModel()
        viewModel.delegate = self
        let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeController = homeStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeController.viewModel = viewModel
        self.navigationController?.pushViewController(homeController, animated: false)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func openNewScreen(index: Int) {
         print("Login Start !!! HomeCoordinator")
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.start()
    }
}
