//
//  WeatherUtility.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//
import Foundation
import UIKit

class WeatherUtility {

    
    static let shared = WeatherUtility()
    
    //@function setUserAvailabilityStatus()
    //@abstract This function is use for set online/offline user
    func showAlertViewController(title:String, message:String, okayCallBack:(()->Void)?, cancelCallBack:(()->Void)?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: AppString.Okay, style: .default, handler: { action in
            okayCallBack?()
        }))
        alert.addAction(UIAlertAction(title: AppString.Cancel, style: .cancel, handler: { action in
            cancelCallBack?()
        }))
        
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    func documentDirectoryPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    func selectedTemperatureUnit() -> TempratureUnit? {
        if AppConst.userDefault.value(forKey: AppConst.TemperaturUnitKey) != nil {
            let rawInt = ((AppConst.userDefault.value(forKey: AppConst.TemperaturUnitKey) as! String).lowercased() == TempratureUnit.Celsius.tempratureUnitKey.lowercased() ? 0 : 1)
            return TempratureUnit.init(rawValue: rawInt)
        }else {
            let rawInt = 0
            return TempratureUnit.init(rawValue: rawInt)
        }
    }

}
