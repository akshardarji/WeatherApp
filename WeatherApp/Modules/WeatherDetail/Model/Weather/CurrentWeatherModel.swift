//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import ObjectMapper

class CurrentWeatherModel: NSObject,Mappable {
    
    var id: Int?
    var main: String?
    var desc: String?
    var icon: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        desc <- map["description"]
        icon <- map["icon"]
    }
}
