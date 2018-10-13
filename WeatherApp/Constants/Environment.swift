//
//  Environment.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation

enum Environment : String
{
    case development = "Development"
    case production = "Production"
    
    
    var apiUrl: String {
        switch self {
        case .development: return "http://api.openweathermap.org/"
        case .production: return ""
        }
    }
    
    var imageUrl: String {
        switch self {
        case .development: return apiUrl + "img/w/"
        case .production: return ""
        }
    }
}
