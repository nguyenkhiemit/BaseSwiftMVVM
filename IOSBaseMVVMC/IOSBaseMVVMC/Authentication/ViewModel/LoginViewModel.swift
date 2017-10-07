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
    
    var validateEmailVariable = Variable<String>("")
    
    var validatePasswordVariable = Variable<String>("")

    var delegate: LoginCoordinatorDelegate?
    
    var disposeBag = DisposeBag()
    
    lazy var requestManager = {
        return AuthenticationRequestManager()
    }()
    
    init() {
    }
    
    func openRegisterScreen() {
        delegate?.openRegisterScreen()
    }
    
    func login() {
        let username = self.usernameVariable.value
        let password = self.passwordVariable.value
        if username.validateEmail() != "" {
            validateEmailVariable.value = username.validateEmail()
            return
        } else {
            validateEmailVariable.value = ""
        }
        if password.validatePassword() != "" {
            validatePasswordVariable.value = password.validatePassword()
            return
        } else {
            validatePasswordVariable.value = ""
        }
        var loginRequest = LoginRequest()
        loginRequest.username = username
        loginRequest.password = password
        requestManager.login(loginRequest: loginRequest).subscribe {
            response in
            print("login response = \(response.element?.email!)")
        }.disposed(by: disposeBag)
    }
    
    func back() {
        delegate?.back()
    }
}
