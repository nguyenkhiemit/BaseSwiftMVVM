//
//  MenuCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/29/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit
final class MenuCoordinator: BaseCoordinator {
    
    override func start() {
        let viewController = MenuViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        navigationController?.pushViewController(navigation, animated: true)
    }
}
