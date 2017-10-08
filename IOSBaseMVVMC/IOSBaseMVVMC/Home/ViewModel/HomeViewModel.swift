//
//  HomeViewModel.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    var delegate: HomeCoordinatorDelegate?
    
    lazy var requestManager: HomeRequestManager = {
       return HomeRequestManager()
    }()
    
    init() {
        
    }
    
    func openNewScreen(index: Int) {
        delegate?.openNewScreen(index: index)
    }
    
    func loadListBooking(page: Int, pageSize: Int) -> Observable<[Booking]>{
        var bookingRequest: BookingRequest = BookingRequest()
        bookingRequest.page = page
        bookingRequest.pageSize = pageSize
        return requestManager.getListBooking(bookingRequest: bookingRequest).flatMap {
            response -> Observable<[Booking]> in
            guard let data = response.data else {
                return Observable.error(CommonError.parsingError)
            }
            guard let results = data.results else {
                return Observable.error(CommonError.parsingError)
            }
            return Observable.just(results)
        }
    }
}
