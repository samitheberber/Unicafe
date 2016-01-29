//
//  RestaurantResponse.swift
//  Unicafe
//
//  Created by Sami Saada on 29.01.2016.
//
//

import Foundation
import ObjectMapper

class RestaurantResponse: Mappable {
    var status: String?
    var data: [Restaurant]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        data <- map["data"]
    }
}
