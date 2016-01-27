//
//  RestaurantParser.swift
//  Unicafe
//
//  Created by Sami Saada on 27.01.2016.
//
//

import Foundation
import SwiftyJSON
import Alamofire

class RestaurantParser {
    static let api_url = "http://hyy-lounastyokalu-production.herokuapp.com/publicapi/restaurants"

    class func getRestaurants(callback: ([Restaurant]) -> Void) {
        Alamofire.request(.GET, api_url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    if json["status"].stringValue == "OK" {
                        var restaurants = [Restaurant]()
                        for (_,subJson):(String, JSON) in json["data"] {
                            //Do something you want
                            restaurants.append(Restaurant(id: subJson["id"].stringValue, name: subJson["name"].stringValue, areacode: subJson["areacode"].stringValue))
                        }
                        callback(restaurants)
                    }
                }
            case .Failure(_):
                break
            }
        }
    }
}