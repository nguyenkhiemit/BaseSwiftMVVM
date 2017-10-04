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
    func requestAPIJSON(api: ClientApi, parameters: [String: Any]? = nil,
                        headers: [String: String]? = nil, encoding: ParameterEncoding? = nil)  -> Observable<(HTTPURLResponse, Any)> {
        let url = api.baseURL + api.path
        
        let finalHeaders: [String: String] = {
            if let headers = headers {
                return headers
            }
            return getDefaultHeaderTypeJSON()
        }()
        
        let finalEncoding: ParameterEncoding = {
            if let encoding = encoding {
                return encoding
            }
            return JSONEncoding.default
        }()
        return requestJSON(api.method, url, parameters: parameters, encoding: finalEncoding, headers: finalHeaders)
    }
    
    func requestAPIData(api: ClientApi, parameters: [String: Any]? = nil,
                        headers: [String: String]? = nil, encoding: ParameterEncoding? = nil) -> Observable<(HTTPURLResponse, Data)> {
        let url = api.baseURL + api.path
        
        let finalHeaders: [String: String] = {
            if let headers = headers {
                return headers
            }
            return getDefaultHeaderTypeJSON()
        }()
        
        let finalEncoding: ParameterEncoding = {
            if let encoding = encoding {
                return encoding
            }
            return JSONEncoding.default
        }()
        return requestData(api.method, url, parameters: parameters, encoding: finalEncoding, headers: finalHeaders)
    }
}


