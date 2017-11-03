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

class AuthenticationRequestManager {
    
    lazy var provider: Provider = {
        return Provider()
    }()
    
    func login(loginRequest: LoginRequest) -> Observable<AccountResponse> {
        let loginObservable: Observable<LoginResponse> = doLoginRequest(loginRequest: loginRequest)
        return loginObservable.flatMap {
            _ in
            return self.doGetAccountRequest()
        }
    }
    
    func register(registerRequest: RegisterRequest) -> Observable<AccountResponse> {
        var loginRequest = LoginRequest()
        loginRequest.username = registerRequest.username
        loginRequest.password = registerRequest.password
        let registerObservale: Observable<RegisterResponse> = doRegisterRequest(registerRequest: registerRequest)
        return registerObservale.flatMap {
            _ in
            return self.login(loginRequest: loginRequest)
        }
    }
    
    func doLoginRequest(loginRequest: LoginRequest) -> Observable<LoginResponse> {
        let param: [String: Any] = [
            "username": loginRequest.username ?? "",
            "password": loginRequest.password ?? "",
            "client_id": CLIENT_ID,
            "client_secret": CLIENT_SECRET,
            "grant_type": GRANT_PASS_TYPE
        ]
        let encoding: ParameterEncoding = URLEncoding.httpBody
        var headers = [String: String]()
        headers["Content-Type"] = "application/x-www-form-urlencoded"
        return provider.requestAPIJSON(api: ClientApi.login, parameters: param, encoding: encoding, headers: headers).flatMap {
            response, json -> Observable<LoginResponse> in
            guard let json = json as? [String: Any] else {
                return Observable.error(CommonError.parsingError)
            }
            guard let loginResponse = Mapper<LoginResponse>().map(JSONObject: json) else {
                return Observable.error(CommonError.parsingError)
            }
            UserDefaultUtils.instance.save(key: UserDefaultsKey.authTokenType, value: "Bearer")
            print("loginResponse.accessToken 1 =====>\(loginResponse.accessToken)")
            UserDefaultUtils.instance.save(key: UserDefaultsKey.authAccessToken, value: loginResponse.accessToken)
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
    
    func doRegisterRequest(registerRequest: RegisterRequest) -> Observable<RegisterResponse> {
        let param: [String: Any] = [
            "email": registerRequest.username ?? "",
            "password": registerRequest.password ?? ""
        ]
        return provider.requestAPIJSON(api: ClientApi.register, parameters: param).flatMap {
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
