//
//  Restaurant.swift
//  Unicafe
//
//  Created by Sami Saada on 29.01.2016.
//
//

import Foundation
import ObjectMapper

class Restaurant: Mappable {
    var id: String?
    var name: String?
    var areacode: String?
    
    required init?(_ map: Map){
    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        areacode <- map["areacode"]
    }
}