//
//  AuthentValidateUtils.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/7/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation

extension String {
    func validatePassword() -> String {
        if self == "" {
            return "Warning pass empty".localized()
        } else if self.count < 8 {
            return "Warning pass format".localized()
        } else {
            return ""
        }
    }
    
    func validateEmail() -> String {
        if self == "" {
            return "Warning email empty".localized()
        } else if !emailValidator(enteredEmail: self) {
            return "Warning email format".localized()
        } else {
            return ""
        }
    }
    
    func emailValidator(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
}
