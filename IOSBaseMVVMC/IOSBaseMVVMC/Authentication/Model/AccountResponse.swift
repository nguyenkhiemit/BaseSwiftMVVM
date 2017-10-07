//
//  AccountResponse.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class AccountResponse: Mappable {
    
    var user: User?
    
    var email: String?
    
    var countryPhoneCode: String?
    
    var memberType: String?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        user <- map["user"]
        email <- map["email"]
        countryPhoneCode <- map["country_phone_code"]
        memberType <- map["member_type"]
    }
}

class User: Mappable {
    
    var fullName: String?
    
    var dateJoined: String?
    
    var lastLogin: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        fullName <- map["full_name"]
        dateJoined <- map["date_joined"]
        lastLogin <- map["last_login"]
    }
}
