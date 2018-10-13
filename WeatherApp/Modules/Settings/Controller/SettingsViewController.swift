//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by Akshar Darji on 12/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit
import SafariServices

class SettingsViewController: BaseViewController {

    @IBOutlet weak var switchTemp: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let unit = WeatherUtility.shared.selectedTemperatureUnit() {
            switch unit {
            case .Celsius:
                switchTemp.setOn(false, animated: true)
                break
            case .Fahrenheit:
                switchTemp.setOn(true, animated: true)
                break
            }
            
        }
    }
    @IBAction func tempUnitChanged(_ sender: Any) {
        func setUserDefaultValueForTemp(unit:TempratureUnit) {
            let key = unit.tempratureUnitKey
            AppConst.userDefault.set(key, forKey: AppConst.TemperaturUnitKey)
            AppConst.userDefault.synchronize()
        }
        
        let tempSwitch = (sender as! UISwitch)
        
        if tempSwitch.isOn {
            setUserDefaultValueForTemp(unit: .Fahrenheit)
        } else {
            setUserDefaultValueForTemp(unit: .Celsius)
        }
        
    }
    @IBAction func resetBookmarksAction(_ sender: Any) {
        WeatherUtility.shared.showAlertViewController(title: "", message: AppString.resetBookmark, okayCallBack: {
            DataManager.shared.ResetData()
        }, cancelCallBack: nil)
    }
    
    @IBAction func helpAndSupportAction(_ sender: Any) {
        openHelpDeskView()
    }
}

extension SettingsViewController: SFSafariViewControllerDelegate {
    
    func openHelpDeskView() {
        
        // On the place of creating html file just putting here "https://www.google.com"
        
        let safariVC = SFSafariViewController(url: NSURL(string: "https://www.google.com")! as URL)
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
