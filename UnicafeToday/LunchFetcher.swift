//
//  LunchFetcher.swift
//  Unicafe
//
//  Created by Sami Saada on 29.01.2016.
//
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class LunchFetcher {
    static let api_url = "http://hyy-lounastyokalu-production.herokuapp.com/publicapi/restaurant/11"

    class func getLunches(callback: ([DailyLunches]) -> Void) {
        Alamofire.request(.GET, api_url).validate().responseObject { (response: Response<LunchResponse, NSError>) in
            if let week = response.result.value?.data {
                callback(week)
            }
        }
    }
}