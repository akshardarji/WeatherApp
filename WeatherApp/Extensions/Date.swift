//
//  Date.swift
//  Skinquiry
//
//  Created by codal on 11/07/18.
//  Copyright © 2018 Codal. All rights reserved.
//

import Foundation
import UIKit


extension Date {

    func getMonthNumber() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.init(abbreviation: "UTC")
        dateFormatter.dateFormat = "MM"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
    func getDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.init(abbreviation: "UTC")
        dateFormatter.dateFormat = "dd"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
    func getHour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.init(abbreviation: "UTC")
        dateFormatter.dateFormat = "hh"
        let strHour = dateFormatter.string(from: self)
        return strHour
    }
}

