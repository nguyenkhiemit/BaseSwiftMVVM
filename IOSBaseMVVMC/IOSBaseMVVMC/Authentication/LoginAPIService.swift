//
//  LoginService.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire

class LoginAPIService {
    
    static func login(request: LoginRequest) -> Variable<LoginResponse> {
        return requestJSON(<#T##method: HTTPMethod##HTTPMethod#>, <#T##url: URLConvertible##URLConvertible#>, parameters: <#T##[String : Any]?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##[String : String]?#>)
    }
}
