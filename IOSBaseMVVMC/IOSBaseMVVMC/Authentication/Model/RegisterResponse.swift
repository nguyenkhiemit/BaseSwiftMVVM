//
//  RegisterResponse.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class RegisterResponse: Mappable {

    var status: String?
    
    var data: RegisterData?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        status <- map["status"]
        data <- map["data"]
    }
}

class RegisterData: Mappable {
    
    var email: String?
    var fullName: String?
    var memberType: String?
    
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        email <- map["email"]
        fullName <- map["full_name"]
        memberType <- map["member_type"]
    }
}
