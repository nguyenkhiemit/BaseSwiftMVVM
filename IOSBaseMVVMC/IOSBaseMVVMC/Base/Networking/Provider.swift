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
    
    fileprivate let networkTimeout: TimeInterval = 30.0
    
    fileprivate let backgroundScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
    
    fileprivate func getDefaultHeaderTypeJSON() -> [String: String] {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json; charset=UTF-8"
        if let accessToken = UserDefaultUtils.instance.getAccessTokenWithValidate() {
            print("loginResponse.accessToken 2 =====>\(accessToken)")
            headers["Authorization"] = accessToken
        }
        return headers
    }
    
    fileprivate func getDefaultHeaderTypeData() -> String {
        return "application/x-www-form-urlencoded"
    }
    
    fileprivate func getDefaultEncoding(method: HTTPMethod) -> ParameterEncoding {
        if method == .get {
            return URLEncoding.default
        } else {
            return JSONEncoding.default
        }
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
    
    func requestAPIJSON(api: ClientApi,
                        parameters: [String: Any]? = nil,
                        encoding: ParameterEncoding? = nil,
                        headers: [String: String]? = nil)  -> Observable<(HTTPURLResponse, Any)> {
        let url = api.baseURL + api.path
       
        let finalEncoding: ParameterEncoding = {
            if let encoding = encoding {
                return encoding
            }
            return getDefaultEncoding(method: api.method)
        }()
        
        let finalHeaders: [String: String] = {
            if let headers = headers {
                return headers
            }
            return getDefaultHeaderTypeJSON()
        }()
    
        print("url = \(url)")
        print("parameters = \(parameters ?? [:])")
        print("headers = \(finalHeaders)")
        
        return requestJSON(api.method, url, parameters: parameters, encoding: finalEncoding, headers: finalHeaders)
        .debug()
        .timeout(networkTimeout, scheduler: backgroundScheduler)
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
        .debug()
        .retry(2)
        .timeout(networkTimeout, scheduler: backgroundScheduler)
    }
}


