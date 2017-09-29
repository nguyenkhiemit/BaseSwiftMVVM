//
//  ClientApi.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/29/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import Alamofire

enum ClientApi{
    
    case register
    
    case login
    
    case userInfo
    
}

extension ClientApi: TargetType {
    
    /// The target's base `URL`.
    var baseURL: URL {
        return URL(string: "https://test-services.vntrip.vn/vntrip/")!
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .login:
            return "oauth2/token/"
        case .register:
            return "users/register-user/"
        case .userInfo:
            return "users/profile/"
        }
    }
    
    /// The HTTP method used in the request.
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .userInfo:
            return .get
        }
    }
    
    
    /// The parameters to be encoded in the request.
    var parameters: [String : Any]? {
        return nil
    }
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    /// Provides stub data for use in testing.
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        return .request
    }
    
}
