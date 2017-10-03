//
//  LoginCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
import SlideMenuControllerSwift

protocol LoginCoordinatorDelegate {
    func openRegisterScreen()
    func back()
}

class LoginCoordinator: BaseCoordinator {
    
    override func start() {
        let viewModel = LoginViewModel()
        viewModel.delegate = self
        let authenStoryboard: UIStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        let loginViewController = authenStoryboard.instantiateViewController(withIdentifier: LoginViewController.Identifier) as! LoginViewController
        loginViewController.viewModel = viewModel
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func openRegisterScreen() {
         print("LoginCoordinator openRegisterScreen")
        let registerCoordinator = RegisterCoordinator(navigationController: navigationController)
        registerCoordinator.start()
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
}

