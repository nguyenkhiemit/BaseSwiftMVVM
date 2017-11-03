//
//  BlueViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class BlueViewModel {
    var delegate: BlueCoordinatorDelegate?
    
    init(navigationController: UINavigationController?) {
        self.delegate = BlueCoordinator(navigationController: navigationController)
    }
    
    func next() {
        delegate?.next()
    }
    
}
