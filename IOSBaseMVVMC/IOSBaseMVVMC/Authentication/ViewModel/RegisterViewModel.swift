//
//  RegisterViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

class RegisterViewModel {
    
    var delegate: RegisterCoordinatorDelegate?
    
    init() {
        
    }
    
    func back() {
        delegate?.back()
    }
    
}
