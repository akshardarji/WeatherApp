//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Akshar Darji on 12/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: BaseViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    lazy var mapViewModel: MapViewModel = {
        return MapViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupLongPressGesture()
    }
}

