//
//  RegisterViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RegisterViewModel {
    
    lazy var requestManager = {
       return AuthenticationRequestManager()
    }()
    
    var delegate: RegisterCoordinatorDelegate?
    
    var usernameVariable = Variable<String>("")
    
    var passwordVariable = Variable<String>("")
    
    var validateEmailVariable = Variable<String>("")
    
    var validatePasswordVariable = Variable<String>("")

    
    init() {
        
    }
    
    func back() {
        delegate?.back()
    }
    
    func register() -> Observable<AccountResponse> {
        let username = usernameVariable.value
        let password = passwordVariable.value
        if username.validateEmail() != "" {
            validateEmailVariable.value = username.validateEmail()
            return Observable.empty()
        } else {
            validateEmailVariable.value = ""
        }
        if password.validatePassword() != "" {
            validatePasswordVariable.value = password.validatePassword()
            return Observable.empty()
        } else {
            validatePasswordVariable.value = ""
        }
        var registerRequest = RegisterRequest()
        registerRequest.username = username
        registerRequest.password = password
        return requestManager.register(registerRequest: registerRequest)
    }
    
}
