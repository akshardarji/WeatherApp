//
//  MapViewControllerExtension.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension MapViewController  {
    
    /// Long Press Gesture initialize for pinning over map
    func setupLongPressGesture() -> Void {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(gesture:)))
        longPressGesture.minimumPressDuration = 0.5
        self.mapView.addGestureRecognizer(longPressGesture)
    }
    
    /// Long Press Gesture Action
    @objc func addAnnotation(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .ended {
            let point = gesture.location(in: self.mapView)
            let coordinate = self.mapView.convert(point, toCoordinateFrom: self.mapView)
            let pointAnnotation = MKPointAnnotation()
            pointAnnotation.coordinate = coordinate
            
            let loc = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            // Fetching GeoCode Location Data
            mapViewModel.getReverseGeocodeLocation(loc) { (placemarks, error) in
                let placemark = placemarks?.first
                if placemark?.administrativeArea != nil && placemark?.country != nil {
                    let annotation = Annotation(withCoordinate: coordinate)
                    annotation.locality = placemark?.locality
                    annotation.country = placemark?.country
                    // Adding Bookmark in DataManager
                    self.addBookmarkInDataManager(pointAnnotation, annotation: annotation)
                } else {
                    self.ErrorWhileFetchingLocation()
                }
            }
        }
    }
    
    func addBookmarkInDataManager(_ point:MKPointAnnotation, annotation: Annotation) {
        WeatherUtility.shared.showAlertViewController(title: ((annotation.locality ?? "") + ", " + (annotation.country ?? "")), message: AppString.bookmarkLocation, okayCallBack: {
            self.mapView.addAnnotation(point)
            DataManager.shared.addAnnotation(annotation: annotation)
        }, cancelCallBack: {
            self.mapView.removeAnnotation(point)
        })
    }
    
    func ErrorWhileFetchingLocation() {
        WeatherUtility.shared.showAlertViewController(title: AppString.Error, message: AppString.locationNotFound, okayCallBack: nil, cancelCallBack: nil)
    }
}
