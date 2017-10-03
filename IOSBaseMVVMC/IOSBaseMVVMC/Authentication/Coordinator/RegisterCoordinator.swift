//
//  RegisterCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterCoordinatorDelegate {
    func back()
}

class RegisterCoordinator: BaseCoordinator {
    
    override func start() {
        let viewModel = RegisterViewModel()
        viewModel.delegate = self
        let authenStoryboard = UIStoryboard.init(name: "Authentication", bundle: nil)
        let registerController = authenStoryboard.instantiateViewController(withIdentifier: RegisterViewController.Identifier) as! RegisterViewController
        registerController.viewModel = viewModel
        navigationController?.pushViewController(registerController, animated: true)
    }
}

extension RegisterCoordinator: RegisterCoordinatorDelegate {
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
