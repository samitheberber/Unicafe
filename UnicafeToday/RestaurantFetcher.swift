//
//  RestaurantParser.swift
//  Unicafe
//
//  Created by Sami Saada on 29.01.2016.
//
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class RestaurantFetcher {
    static let api_url = "http://hyy-lounastyokalu-production.herokuapp.com/publicapi/restaurants"
    
    class func getRestaurants(callback: ([Restaurant]) -> Void) {
        Alamofire.request(.GET, api_url).validate().responseObject { (response: Response<RestaurantResponse, NSError>) in
            if let restaurants = response.result.value?.data {
                callback(restaurants)
            }
        }
    }
}