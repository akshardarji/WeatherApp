//
//  Annotation.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    
    internal var coordinate: CLLocationCoordinate2D
    var locality: String? = ""
    var country: String? = ""
    
    init(withCoordinate coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }

    init(withDictionary dictionary: NSDictionary) {
        let latitude = dictionary.object(forKey: "lat") as! Double
        let longitude = dictionary.object(forKey: "long") as! Double
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.locality = dictionary.object(forKey: "locality") as? String
        self.country = dictionary.object(forKey: "country") as? String
    }
    
    func dictionaryCreation() -> NSDictionary {
        let annotationDict = ["lat":coordinate.latitude,"long": coordinate.longitude,"locality":locality ?? "", "country" : country ?? ""] as [String : Any]
        let nsDict = NSDictionary.init(dictionary: annotationDict)
        return nsDict
    }
}
