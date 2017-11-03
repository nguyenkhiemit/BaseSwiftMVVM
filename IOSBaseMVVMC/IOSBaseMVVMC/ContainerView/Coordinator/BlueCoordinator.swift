//
//  BlueCoordinator.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

protocol BlueCoordinatorDelegate {
    func next()
}

class BlueCoordinator: BaseCoordinator {
    
}

extension BlueCoordinator: BlueCoordinatorDelegate {
    func next() {
        let pinkCoordinator = PinkCoordinator(navigationController: navigationController)
        pinkCoordinator.start()
    }

}
