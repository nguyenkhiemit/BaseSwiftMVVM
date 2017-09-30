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
        let viewModel = MenuViewModel()
        let viewController = MenuViewController(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        navigationController?.pushViewController(navigation, animated: true)
    }
}
