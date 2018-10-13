//
//  SysWeatherModel.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import ObjectMapper

class SysWeatherModel: NSObject,Mappable {
    
    var id: CLongLong?
    var country: String?
    var sunrise: CLongLong?
    var sunset: CLongLong?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        country <- map["country"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}
