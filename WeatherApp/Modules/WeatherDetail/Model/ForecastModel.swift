//
//  ForecastModel.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import ObjectMapper

class ForecastModel: NSObject,Mappable {
    
    var forecastArray = [WeatherModel]()
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        forecastArray <- map["list"]
    }
}

