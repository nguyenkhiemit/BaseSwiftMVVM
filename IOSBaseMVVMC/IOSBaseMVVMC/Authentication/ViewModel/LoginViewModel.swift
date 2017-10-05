//
//  LoginViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    
    var usernameVariable = Variable<String>("")
    
    var passwordVariable = Variable<String>("")

    var delegate: LoginCoordinatorDelegate?
    
    lazy var requestManager = {
        return AuthenticationRequestManager()
    }()
    
    init() {
    }
    
    func openRegisterScreen() {
        delegate?.openRegisterScreen()
    }
    
    func login() {
        print("username = \(self.usernameVariable.value)")
        print("password = \(self.passwordVariable.value)")
        let username = self.usernameVariable.value
        let password = self.passwordVariable.value
        requestManager.loginRequest(username: username, password: password)
    }
    
    func back() {
        delegate?.back()
    }
}
