//
//  BookingResponse.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 10/7/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class BookingResponse: Mappable {
    var data: BookingData?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
}

class BookingData: Mappable {
    var nextPage: String?
    var results: [Booking]?
    
    required init?(map: Map) {
        nextPage <- map["next"]
        results <- map["results"]
    }
    
    func mapping(map: Map) {
        
    }
}

class Booking: Mappable {
    var image: String?
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        image <- map["image"]
        name <- map["name"]
    }
}
