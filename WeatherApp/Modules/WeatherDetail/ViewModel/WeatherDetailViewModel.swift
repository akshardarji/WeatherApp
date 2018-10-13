//
//  WeatherDetailViewModel.swift
//  WeatherApp
//
//  Created by Akshar Darji on 12/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit

struct WeatherDetailViewModel {

}

extension WeatherDetailViewModel{
    
    func getTodaysWeatherDetails(_ annotation:Annotation, completion:@escaping ((WeatherModel)->Void)) {
        IndicatorManager.shared.show(withStatus: AppString.currentWeatherStatusMsg)
        NetworkService.shared.callService(NetworkService.shared.serviceProvider, type: ServiceProvider.todaysWeather(params: ["lat":annotation.coordinate.latitude,"lon":annotation.coordinate.longitude]), success: { (result: WeatherModel) in
            IndicatorManager.shared.dismiss()
            return completion(result)
        }) { (error) in
            IndicatorManager.shared.dismiss()
        }
    }
    
    func getForecastWeatherList(_ annotation:Annotation, completion:@escaping ((ForecastModel)->Void)) {
        IndicatorManager.shared.show(withStatus: AppString.foreCastWeatherStatusMsg)
        NetworkService.shared.callService(NetworkService.shared.serviceProvider, type: ServiceProvider.fiveDayForecasting(params: ["lat":annotation.coordinate.latitude,"lon":annotation.coordinate.longitude]), success: { (result: ForecastModel) in
            IndicatorManager.shared.dismiss()
            return completion(result)
        }) { (error) in
            IndicatorManager.shared.dismiss()
        }
    }
}
