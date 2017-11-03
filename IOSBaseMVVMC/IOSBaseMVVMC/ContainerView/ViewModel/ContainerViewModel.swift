//
//  CoordinatorViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

class ContainerViewModel {

    var delegate: ContainerCoordinatorDelegate?
    
    func back() {
        delegate?.back()
    }
}
