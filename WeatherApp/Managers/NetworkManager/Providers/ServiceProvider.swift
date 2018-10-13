//
//  ServiceProvider.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import  Moya

enum ServiceProvider {
    case todaysWeather(params: [String : Any])
    case fiveDayForecasting(params: [String : Any])
}

extension ServiceProvider : TargetType {
    
    var baseURL: URL {
        return (AppConst.currentEnvironment.apiUrl + "data/2.5/").toUrl
    }
   
    var path: String {
        switch self {
        case .todaysWeather: return "weather/"
        case .fiveDayForecasting: return "forecast/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .todaysWeather: return .get
        case .fiveDayForecasting: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .todaysWeather(var params): return .requestParameters(parameters: setDefaultParam(params: &params), encoding: URLEncoding.default)
        case .fiveDayForecasting(var params): return .requestParameters(parameters: setDefaultParam(params: &params), encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .todaysWeather: return nil
        case .fiveDayForecasting: return nil
        }
    }
    
    func setDefaultParam(params:inout [String : Any]) -> [String : Any]{
        params["appid"] = "c6e381d8c7ff98f0fee43775817cf6ad"
        params["units"] = WeatherUtility.shared.selectedTemperatureUnit()?.tempratureUnitKey.lowercased() ?? "metric"
        return params
    }
}
//http://api.openweathermap.org/data/2.5/weather?lat=0&lon=0&appid=c6e381d8c7ff98f0fee43775817cf6ad&units=metric
//http://api.openweathermap.org/data/2.5/forecast?lat=0&lon=0&appid=c6e381d8c7ff98f0fee43775817cf6ad&units=metric
