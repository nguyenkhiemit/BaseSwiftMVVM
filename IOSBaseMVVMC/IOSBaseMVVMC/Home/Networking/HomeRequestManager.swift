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
    
    func getListBooking(bookingRequest: BookingRequest) -> Driver<Result<[Booking]>> {
        let param: [String: Any] = [
            "page": bookingRequest.page ?? 0,
            "page_size": bookingRequest.pageSize ?? 0
        ]
        return provider.requestAPIJSON(api: ClientApi.listBooking, parameters: param)
            .subscribeOn(MainScheduler.instance)
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background)) // we don’t really know from the code above that requestJSON will return
            .observeOn(MainScheduler.instance)
            .map {
            response, json -> Result<[Booking]> in
            if(response.statusCode == 200) {
                guard let json = json as? [String: Any] else {
                    return .failure(CommonError.parsingError)
                }
                guard let bookingResponse: BookingResponse = Mapper<BookingResponse>().map(JSONObject: json) else {
                    return .failure(CommonError.parsingError)
                }
                guard let bookingData = bookingResponse.data else {
                    return .failure(CommonError.parsingError)
                }
                guard let arrayBooking = bookingData.results else {
                      return .failure(CommonError.parsingError)
                }
                return .success(arrayBooking)
            } else {
                return .failure(CommonError.networkError)
            }
        }
        .observeOn(MainScheduler.instance) // switch to MainScheduler, UI updates
        .asDriver(onErrorJustReturn: .failure(CommonError.parsingError))
    }
}
