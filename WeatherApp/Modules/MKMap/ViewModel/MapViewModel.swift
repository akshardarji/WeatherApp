//
//  MapViewModel.swift
//  WeatherApp
//
//  Created by Akshar Darji on 12/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit
import CoreLocation

struct MapViewModel {

}

extension MapViewModel{
    
    func getReverseGeocodeLocation(_ loc:CLLocation, completion: @escaping CLGeocodeCompletionHandler) {
        IndicatorManager.shared.show()
        CLGeocoder().reverseGeocodeLocation(loc, completionHandler: { (placemarks, error) in
            guard error == nil else {
                WeatherUtility.shared.showAlertViewController(title: "Error", message: (error?.localizedDescription)!, okayCallBack: nil,cancelCallBack: nil)
                return
            }
            completion(placemarks, error)
            IndicatorManager.shared.dismiss()
        })
    }
}
