//
//  LoginResponse.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse: Mappable {
    
    var accessToken: String?
    var tokenType: String?
    var refreshToken: String?
    var scope: String?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        accessToken <- map["access_token"]
        tokenType <- map["token_type"]
        refreshToken <- map["refresh_token"]
        scope <- map["scope"]
    }
}
