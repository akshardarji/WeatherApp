//
//  AppTheme.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import UIKit

enum AppTheme: String {
    
    case primaryColor = "#6F98EB"
    
    var color: UIColor {
        return UIColor(hex: self.rawValue)
    }
    
}
