//
//  Provider.swift
//  IOSBaseMVVMC
//
//  Created by KhiemND on 10/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift
import RxCocoa

typealias NetworkStartHandler = (() -> (Void))
typealias NetworkFinishedHandler = (() -> (Void))
typealias NetworkRequestSuccess = (() -> (Void))
typealias NetworkRequestFailure = (() -> (Void))

class Provider {
    
    private let networkTimeout: TimeInterval = 15.0
    
    fileprivate func getDefaultHeaderTypeJSON() -> [String: String] {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json; charset=UTF-8"
        if let accessToken = UserDefaultUtils.instance.getAccessTokenValidate() {
            headers["Authorization"] = accessToken
        }
        return headers
    }
    
    fileprivate func getDefaultHeaderTypeData() -> String {
        return "application/x-www-form-urlencoded"
    }
    
    fileprivate func createBodyDataString(parameters: [String: Any]) -> String {
        var parts = [String]()
        let escape = CharacterSet.init(charactersIn: "#%/<>?@\\^`{|};").inverted
        for parameter in parameters {
            if let value = parameter.value as? String, let escapedValue = value.addingPercentEncoding(withAllowedCharacters: escape) {
                parts.append("\(parameter.key)=\(escapedValue)")
            }
        }
        return parts.joined(separator: "&")
    }
}

extension Provider {
    func requestNetwork(api: ClientApi, parameters: [String: Any]? = nil,
                        headers: [String: String]? = nil, encoding: ParameterEncoding? = nil) {
        
    }
}


