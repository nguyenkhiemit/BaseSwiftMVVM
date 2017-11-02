//
//  AutumnCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol AutumnCoordinatorDelegate {
    func next()
    func back()
}

class AutumnCoordinator: BaseCoordinator {
    
    override func start() {
        let viewModel = AutumnViewModel()
        viewModel.delegate = self
        let storyboard: UIStoryboard = UIStoryboard(name: "TabLayout", bundle: nil)
        let autumnController = storyboard.instantiateViewController(withIdentifier: AutumnViewController.Identifier) as! AutumnViewController
        autumnController.viewModel = viewModel
        self.navigationController?.pushViewController(autumnController, animated: true)
    }
}
extension AutumnCoordinator: AutumnCoordinatorDelegate {
    func next() {
        
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
