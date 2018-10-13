//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Akshar Darji on 12/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit

class WeatherDetailViewController: BaseViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescLabel: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var windyLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var elevationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var weatherDetailViewModel: WeatherDetailViewModel = {
        return WeatherDetailViewModel()
    }()
    
    var annotation: Annotation?
    var weatherData : WeatherModel?
    var forecastListing = [WeatherModel]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetchingCurrentWeatherData()
        self.fetchingForecastingWeatherData()
        collectionView.register(ForecastCollectionCell.self)
    }
}
