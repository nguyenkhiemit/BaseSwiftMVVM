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
    
    func loginRequest(username: String, password: String) {
        let param: [String: Any] = [
            "username": username,
            "password": password,
            "client_id": CLIENT_ID,
            "client_secret": CLIENT_SECRET,
            "grant_type": GRANT_PASS_TYPE
        ]
        provider.requestAPIJSON(api: ClientApi.login, parameters: param).map {
            (response, json) -> LoginResponse? in
            if response.statusCode == 200 {
                guard let json = json as? [String : Any] else {
                    return nil
                }
                if let repos = LoginResponse(json) {
                    return repos
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        
    }
}
