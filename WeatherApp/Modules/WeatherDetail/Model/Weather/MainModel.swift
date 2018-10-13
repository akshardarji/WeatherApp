//
//  MainModel.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import ObjectMapper

class MainModel: NSObject,Mappable {
    
    var temperature: Float?
    var minTemp: Float?
    var humidity:Float?
    var maxTemp: Float?
    var pressure:Float?
    var elevation:Float?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        temperature <- map["temp"]
        minTemp <- map["temp_min"]
        humidity <- map["humidity"]
        maxTemp <- map["temp_max"]
        pressure <- map["pressure"]
        elevation <- map["sea_level"]
    }
}
