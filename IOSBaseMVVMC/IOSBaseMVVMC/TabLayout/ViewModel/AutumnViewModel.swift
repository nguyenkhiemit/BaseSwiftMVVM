//
//  AutumnViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 11/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

class AutumnViewModel {
    var delegate: AutumnCoordinatorDelegate?
    
    func next() {
        delegate?.next()
    }
    
    func back() {
        delegate?.back()
    }
}
