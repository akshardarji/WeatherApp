//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import ObjectMapper

class WindModel: NSObject,Mappable {
    
    var windSpeed: Float?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        windSpeed <- map["speed"]
    }
}
