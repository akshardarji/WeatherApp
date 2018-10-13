//
//  WeatherDetailViewControllerExtension.swift
//  WeatherApp
//
//  Created by Akshar Darji on 12/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit

extension WeatherDetailViewController {
    
    /// Fetching Current Weather Data For Selected Annotation.
    func fetchingCurrentWeatherData() {
        if annotation != nil {
            weatherDetailViewModel.getTodaysWeatherDetails(annotation!) { (weatherResult) in
                self.weatherData = weatherResult
                self.setWeatherData()
            }
        }
    }

    /// Fetching Current Weather Data For Selected Annotation.
    func fetchingForecastingWeatherData() {
        if annotation != nil {
            weatherDetailViewModel.getForecastWeatherList(annotation!) { (forecastResult) in
                self.forecastListing.append(contentsOf: forecastResult.forecastArray)
                self.collectionView.reloadData()
            }
        }
    }
}


extension WeatherDetailViewController {

    /// Set Weather Data For UIControl
    func setWeatherData(){
//        if let weatherCityName = self.weatherData?.name {
        
        cityLabel.text = (annotation?.locality ?? "") //+ ", " + (annotation?.country ?? "")
        
        if let weatherDesc = self.weatherData?.weather?.first?.desc {
            weatherDescLabel.text = weatherDesc
        }
        
        if let weatherIcon = self.weatherData?.weather?.first?.icon {
            weatherImg.setWith(image: AppConst.currentEnvironment.imageUrl + weatherIcon, placeHolder: UIImage.init())
        }
        
        if let weatherTemp = self.weatherData?.main?.temperature {
            temperatureLabel.text = "\(Int(weatherTemp))" + (WeatherUtility.shared.selectedTemperatureUnit()?.tempratureUnit)!
        }
        
        if let weatherElevation = self.weatherData?.main?.elevation {
            elevationLabel.text = "\(Int(weatherElevation))"
        }
        
        if let weatherPressure = self.weatherData?.main?.pressure {
            pressureLabel.text = "\(weatherPressure)"
        }
        
        if let weatherHumidity = self.weatherData?.main?.humidity {
            humidityLabel.text = "\(Int(weatherHumidity))"
        }
        
        if let weatherWind = self.weatherData?.wind?.windSpeed {
            windyLabel.text = "\(weatherWind)"
        }
     }
}
