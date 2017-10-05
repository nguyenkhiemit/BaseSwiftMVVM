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
    
    var delegate: RegisterCoordinatorDelegate?
    
    var usernameVariable = Variable<String>("")
    
    var passwordVariable = Variable<String>("")
    
    init() {
        
    }
    
    func back() {
        delegate?.back()
    }
    
    func register() {
        
    }
    
}
