//
//  AuthenticationRequestManager.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire
import Alamofire

enum CommonError : Error {
    case parsingError
    case networkError
}

class AuthenticationRequestManager {
    
    lazy var provider: Provider = {
       return Provider()
    }()
    
    func login(loginRequest: LoginRequest) {
        let param: [String: Any] = [
            "username": loginRequest.username,
            "password": loginRequest.password,
            "client_id": CLIENT_ID,
            "client_secret": CLIENT_SECRET,
            "grant_type": GRANT_PASS_TYPE
        ]
        let result = provider.requestAPIJSON(api: ClientApi.login, parameters: param).map { (response, data) in
            return Observable()
        }
        //return result
    }
}
