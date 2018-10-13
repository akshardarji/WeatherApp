//
//  WeatherForecastViewDataSource.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit

extension WeatherDetailViewController: UICollectionViewDataSource , UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard (self.forecastListing.count) > 0 else {
            return 0
        }
        return (self.forecastListing.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionCell.reuseIdentifier, for: indexPath) as! ForecastCollectionCell
        let weatherData = forecastListing[indexPath.row]
        
        if let date = weatherData.dt {
            cell.dateLabel.text = "\((Int(date.getDay()) ?? 0))-\((Int(date.getMonthNumber()) ?? 0))\n\((Int(date.getHour()) ?? 0))"
        }
        
        if let temperature = weatherData.main?.temperature {
            cell.tempLabel.text =  "\(Int(temperature))" + (WeatherUtility.shared.selectedTemperatureUnit()?.tempratureUnit)!
        }
        
        if let iconUrl = weatherData.weather?.first?.icon {
            cell.weatherImg.setWith(image: AppConst.currentEnvironment.imageUrl + iconUrl, placeHolder: UIImage.init())
        }
     
        return cell
    }
}

extension WeatherDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100 , height: 150)
    }
    
}
