//
//  PinkViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

class PinkViewModel {
    
    var delegate: PinkCoordinatorDelegate?
    
    func back() {
        delegate?.back()
    }
}
