//
//  String.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit

extension String {
    
    var toUrl: URL {
        return URL(string: self)!
    }
}
