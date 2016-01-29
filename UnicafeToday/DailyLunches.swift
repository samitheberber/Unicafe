//
//  LunchForWeek.swift
//  Unicafe
//
//  Created by Sami Saada on 29.01.2016.
//
//

import Foundation
import ObjectMapper

class DailyLunches: Mappable {
    var date: String?
    var lunches: [Lunch]?

    required init?(_ map: Map){
    }

    func mapping(map: Map) {
        date <- map["date_en"]
        lunches <- map["data"]
    }
}