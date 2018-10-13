//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherModel: NSObject,Mappable {
    
    var weather: [CurrentWeatherModel]?
    var main: MainModel?
    var wind: WindModel?
    var sys: SysWeatherModel?
    var name: String?
    var dateTimeStamp: CLongLong?
    var dt: Date?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        weather <- map["weather"]
        main <- map["main"]
        wind <- map["wind"]
        sys <- map["sys"]
        name <- map["name"]
        dateTimeStamp <- map["dt"]
        if let timeStamp = dateTimeStamp {
            dt =  Date(timeIntervalSince1970: TimeInterval(timeStamp))
        }
    }
}
