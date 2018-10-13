//
//  AppConst.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation


import Foundation
import UIKit

struct AppConst {
    
    static var currentEnvironment: Environment {
        var config = Configuration()
        return config.environment
    }
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let userDefault = UserDefaults.standard
    
    //AppName
    static let kAppName : String = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    
    //User Default String
    static let TemperaturUnitKey = "TemperaturUnit"
}

/// Temprature Unit Metric: Celsius, Imperial: Fahrenheit
enum TempratureUnit : Int {
    
    case Celsius = 0
    case Fahrenheit = 1
    
    var tempratureUnitKey: String {
        switch self {
        case .Celsius:
            return "Metric"
        case .Fahrenheit:
            return "Imperial"
        }
    }
    
    var tempratureUnitString: String {
        switch self {
        case .Celsius:
            return "Celsius"
        case .Fahrenheit:
            return "Fahrenheit"
        }
    }
    
    var tempratureUnit: String {
        switch self {
        case .Celsius:
            return "°C"
        case .Fahrenheit:
            return "°F"
        }
    }
}
