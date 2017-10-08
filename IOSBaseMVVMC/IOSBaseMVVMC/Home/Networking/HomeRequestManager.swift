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
        
        return provider.requestAPIJSON(api: ClientApi.listBooking, parameters: param).map {
            response, json -> Result<[Booking]> in
            if(response.statusCode == 200) {
                guard let json = json as? [String: Any] else {
                    return Result.failure(CommonError.parsingError)
                }
                guard let bookingResponse: BookingResponse = Mapper<BookingResponse>().map(JSONObject: json) else {
                    return Result.failure(CommonError.parsingError)
                }
                guard let bookingData = bookingResponse.data else {
                    return Result.failure(CommonError.parsingError)
                }
                guard let arrayBooking = bookingData.results else {
                      return Result.failure(CommonError.parsingError)
                }
                return Result.success(arrayBooking)
            } else {
                return Result.failure(CommonError.networkError)
            }
        }.asDriver(onErrorJustReturn: .failure(CommonError.parsingError)) 
    }
}
