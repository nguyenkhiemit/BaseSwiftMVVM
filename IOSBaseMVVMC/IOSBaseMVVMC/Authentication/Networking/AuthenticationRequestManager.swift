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
import SwiftyJSON
import ObjectMapper

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
        provider.requestAPIJSON(api: ClientApi.login, parameters: param, headers: nil, encoding: nil).map {
            reponse, json -> LoginResponse in
            let json = json as? [String: Any]
            let loginResponse = Mapper<LoginResponse>().map(JSONObject: json)
            return loginResponse!
        }.subscribe {
            print("==================")
            print("\($0)")
        }
    }
    
    func register(username: String, password: String) {
        
    }
}
