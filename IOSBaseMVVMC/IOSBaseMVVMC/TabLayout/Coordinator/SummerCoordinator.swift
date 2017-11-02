//
//  SummerCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

protocol SummerCoordinatorDelegate {
    func next()
    func back()
}

class SummerCoordinator: BaseCoordinator {
    
    override func start() {
        let viewModel = SummerViewModel()
        viewModel.delegate = self
        let storyboard: UIStoryboard = UIStoryboard(name: "TabLayout", bundle: nil)
        let summerController = storyboard.instantiateViewController(withIdentifier: SummerViewController.Identifier) as! SummerViewController
        summerController.viewModel = viewModel
        self.navigationController?.pushViewController(summerController, animated: true)
    }
}

extension SummerCoordinator: SummerCoordinatorDelegate {
    func next() {
        
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
