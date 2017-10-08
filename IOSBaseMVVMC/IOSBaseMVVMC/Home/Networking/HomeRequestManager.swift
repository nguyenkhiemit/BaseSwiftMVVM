//
//  BookingRequestManager.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/7/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire
import Alamofire
import SwiftyJSON
import ObjectMapper

class HomeRequestManager {
    
    lazy var provider: Provider = {
        return Provider()
    }()
    
    func getListBooking(bookingRequest: BookingRequest) -> Observable<BookingResponse> {
        let param: [String: Any] = [
            "page": bookingRequest.page ?? 0,
            "page_size": bookingRequest.pageSize ?? 0
        ]
        
        return provider.requestAPIJSON(api: ClientApi.listBooking, parameters: param).flatMap {
            response, json -> Observable<BookingResponse> in
            guard let json = json as? [String: Any] else {
                return Observable.error(CommonError.parsingError)
            }
            guard let bookingResponse = Mapper<BookingResponse>().map(JSONObject: json) else {
                return Observable.error(CommonError.parsingError)
            }
            return Observable.just(bookingResponse)
        }
    }
}
