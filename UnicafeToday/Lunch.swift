//
//  Lunch.swift
//  Unicafe
//
//  Created by Sami Saada on 29.01.2016.
//
//

import Foundation
import ObjectMapper

class Lunch: Mappable {
    var name: String?
    var price: String?

    required init?(_ map: Map){
    }

    func mapping(map: Map) {
        name <- map["name"]
        price <- map["price.name"]
    }
}