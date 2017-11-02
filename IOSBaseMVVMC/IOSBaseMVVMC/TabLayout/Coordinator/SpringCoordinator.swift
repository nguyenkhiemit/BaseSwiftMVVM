//
//  SpringCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol SpringCoordinatorDelegate {
    func next()
    func back()
}

class SpringCoordinator: BaseCoordinator {
    
    var delegate: TabLayoutCoordinatorDelegate?
    
    override func start() {
        let viewModel = SpringViewModel()
        viewModel.delegate = self
        let storyboard: UIStoryboard = UIStoryboard(name: "TabLayout", bundle: nil)
        let springController = storyboard.instantiateViewController(withIdentifier: SpringViewController.Identifier) as! SpringViewController
        springController.viewModel = viewModel
        self.navigationController?.pushViewController(springController, animated: true)
    }
}

extension SpringCoordinator: SpringCoordinatorDelegate {
    func next() {
        let summnerCoordinator = SummerCoordinator(navigationController: self.navigationController)
        summnerCoordinator.start()
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
        delegate?.back()
    }
}
