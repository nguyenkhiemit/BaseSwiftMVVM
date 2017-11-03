//
//  PinkCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol PinkCoordinatorDelegate {
    func back()
}

class PinkCoordinator: BaseCoordinator {
    
    override func start() {
        let viewModel = PinkViewModel()
        viewModel.delegate = self
        let storyboard = UIStoryboard(name: "Container", bundle: nil)
        let pinkController = storyboard.instantiateViewController(withIdentifier: PinkViewController.Identifier) as! PinkViewController
        pinkController.viewModel = viewModel
        self.navigationController?.pushViewController(pinkController, animated: true)
    }
}

extension PinkCoordinator: PinkCoordinatorDelegate {
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
