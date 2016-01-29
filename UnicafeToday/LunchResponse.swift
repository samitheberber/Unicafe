//
//  LunchResponse.swift
//  Unicafe
//
//  Created by Sami Saada on 29.01.2016.
//
//

import Foundation
import ObjectMapper

class LunchResponse: Mappable {
    var status: String?
    var data: [DailyLunches]?

    required init?(_ map: Map){
    }

    func mapping(map: Map) {
        status <- map["status"]
        data <- map["data"]
    }
}
