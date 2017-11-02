//
//  WinterCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol WinterCoordinatorDelegate {
    func next()
    func back()
}

class WinterCoordinator: BaseCoordinator {
    
    var delegate: TabLayoutCoordinatorDelegate?
    
    override func start() {
        let viewModel = WinterViewModel()
        viewModel.delegate = self
        let storyboard: UIStoryboard = UIStoryboard(name: "TabLayout", bundle: nil)
        let winterController = storyboard.instantiateViewController(withIdentifier: WinterViewController.Identifier) as! WinterViewController
        winterController.viewModel = viewModel
        self.navigationController?.pushViewController(winterController, animated: false)
    }
}

extension WinterCoordinator: WinterCoordinatorDelegate {
    func next() {
        let springCoordinator = AutumnCoordinator(navigationController: self.navigationController)
        springCoordinator.start()
    }
    
    func back() {
        self.navigationController?.dismiss(animated: true, completion: nil)
        self.delegate?.back()
    }
}
