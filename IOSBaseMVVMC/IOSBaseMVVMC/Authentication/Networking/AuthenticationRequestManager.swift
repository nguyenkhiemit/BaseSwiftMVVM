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
    
    func login(username: String, password: String) -> Observable<AccountResponse> {
        let loginObservable: Observable<LoginResponse> = doLoginRequest(username: username, password: password)
        return loginObservable.flatMap {
            _ in
            return self.doGetAccountRequest()
        }
    }
    
    func register(username: String, password: String) -> Observable<AccountResponse> {
        var loginRequest = LoginRequest()
        loginRequest.username = username
        loginRequest.password = password
        let registerObservale: Observable<RegisterResponse> = doRegisterRequest(username: username, password: password)
        return registerObservale.flatMap {
            _ in
            return self.login(username: username, password: password)
        }
    }
    
    func doLoginRequest(username: String, password: String) -> Observable<LoginResponse> {
        let param: [String: Any] = [
            "username": username,
            "password": password,
            "client_id": CLIENT_ID,
            "client_secret": CLIENT_SECRET,
            "grant_type": GRANT_PASS_TYPE
        ]
        return provider.requestAPIJSON(api: ClientApi.login, parameters: param, headers: nil, encoding: nil).flatMap {
            response, json -> Observable<LoginResponse> in
            guard let json = json as? [String: Any] else {
                return Observable.error(CommonError.parsingError)
            }
            guard let loginResponse = Mapper<LoginResponse>().map(JSONObject: json) else {
                return Observable.error(CommonError.parsingError)
            }
            UserDefaultUtils.instance.save(key: UserDefaultsKey.authTokenType, value: "Bearer")
            UserDefaultUtils.instance.save(key: UserDefaultsKey.authAccessToken, value: "EwNBXCDphQTcs6vSYz6pAhTrRsGgeU")
            return Observable.just(loginResponse)
        }
    }
    
    func doGetAccountRequest() -> Observable<AccountResponse> {
        return provider.requestAPIJSON(api: ClientApi.userInfo).flatMap {
            response, json -> Observable<AccountResponse> in
            guard let json = json as? [String: Any] else {
                return Observable.error(CommonError.parsingError)
            }
            guard let accountResponse = Mapper<AccountResponse>().map(JSONObject: json) else {
                return Observable.error(CommonError.parsingError)
            }
            return Observable.just(accountResponse)
        }
    }
    
    func doRegisterRequest(username: String, password: String) -> Observable<RegisterResponse> {
        let param: [String: Any] = [
            "email": username,
            "password": password
        ]
        return provider.requestAPIJSON(api: ClientApi.register, parameters: param, headers: nil, encoding: nil).flatMap {
            response, json -> Observable<RegisterResponse> in
            guard let json = json as? [String: Any] else {
                return Observable.error(CommonError.parsingError)
            }
            guard let registerResponse = Mapper<RegisterResponse>().map(JSONObject: json) else {
                return Observable.error(CommonError.parsingError)
            }
        return Observable.just(registerResponse)
        }
    }
}
