//
//  RegisterCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class RegisterCoordinator: BaseCoordinator {
    
    override func start() {
        let authenStoryboard = UIStoryboard.init(name: "Authentication", bundle: nil)
        let registerController = authenStoryboard.instantiateViewController(withIdentifier: RegisterViewController.Identifier) as! RegisterViewController
        let navigation = UINavigationController(rootViewController: registerController)
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
