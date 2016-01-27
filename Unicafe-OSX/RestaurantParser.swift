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
    let api_url = "http://hyy-lounastyokalu-production.herokuapp.com/publicapi/restaurants"
    
    func getRestaurants() {
        Alamofire.request(.GET, api_url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
        }

    }
}