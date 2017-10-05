//
//  RegisterRequest.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

struct RegisterRequest {
    
    var username: String {
        get {
            return self.username
        }
        set {
            self.username = newValue
        }
    }
    
    var password: String {
        get {
            return self.password
        }
        set {
            self.password = newValue
        }
    }

}
