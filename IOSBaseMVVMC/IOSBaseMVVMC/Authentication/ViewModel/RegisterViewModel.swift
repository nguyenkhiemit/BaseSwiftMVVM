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
    
    init() {
        
    }
    
    func back() {
        delegate?.back()
    }
    
    func register() {
        var username = usernameVariable.value
        var password = passwordVariable.value
        requestManager.register(username: username, password: password)
    }
    
}
