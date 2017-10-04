//
//  LoginViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var delegate: LoginCoordinatorDelegate?
    
    init() {
        
    }
    
    func openRegisterScreen() {
        delegate?.openRegisterScreen()
    }
    
    func login() {
        
    }
    
    func back() {
        delegate?.back()
    }
}
