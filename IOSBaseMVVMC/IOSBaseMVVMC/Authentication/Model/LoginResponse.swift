//
//  LoginResponse.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginResponse {
    
    var accessToken: String?
    var tokenType: String?
    var refreshToken: String?
    var scope: String?
    
    init(json: JSON) {
        accessToken = json["access_token"].string
        tokenType = json["token_type"].string
        refreshToken = json["refresh_token"].string
        scope = json["scope"].string
    }
}
