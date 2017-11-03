//
//  ContainerCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol ContainerCoordinatorDelegate {
    func back()
}

class ContainerCoordinator: BaseCoordinator {
    
    override func start() {
        let viewModel = ContainerViewModel()
        viewModel.delegate = self
        let containerStoryboard: UIStoryboard = UIStoryboard(name: "Container", bundle: nil)
        let containerViewController = containerStoryboard.instantiateViewController(withIdentifier: ContainerViewController.Identifier) as! ContainerViewController
        containerViewController.viewModel = viewModel
        self.navigationController?.pushViewController(containerViewController, animated: true)
    }
}

extension ContainerCoordinator: ContainerCoordinatorDelegate {
    func back() {
         self.navigationController?.popViewController(animated: true)
    }
}
