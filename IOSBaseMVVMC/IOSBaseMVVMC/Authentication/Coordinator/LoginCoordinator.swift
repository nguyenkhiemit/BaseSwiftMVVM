//
//  LoginCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class LoginCoordinator: BaseCoordinator {
    
    override func start() {
        let authenStoryboard: UIStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        let loginViewController = authenStoryboard.instantiateViewController(withIdentifier: LoginViewController.Identifier) as! LoginViewController
        loginViewController.slideMenuController()?.closeLeft()
        loginViewController.slideMenuController()?.changeMainViewController(loginViewController, close: true)
        let navigation = UINavigationController(rootViewController: loginViewController)
        self.navigationController?.pushViewController(navigation, animated: true)
    }
}
