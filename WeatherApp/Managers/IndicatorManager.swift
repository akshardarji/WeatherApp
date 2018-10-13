//
//  IndicatorManager.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import SVProgressHUD

class IndicatorManager{
    
    private init() { setDefaultProparty() }
    static let shared = IndicatorManager()
    
    
    func setDefaultProparty(){
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.black)
    }
    
    // Show simple indicator with default setting
    func show(){
        SVProgressHUD.show()
    }
    
    // Show simple indicator with default Setting and message
    func show(withStatus message:String){
         SVProgressHUD.show(withStatus: message)
    }
    
    func showSuccess(withStatus message:String){
        SVProgressHUD.showSuccess(withStatus: message)
    }
    
    func showError(withStatus message:String){
        SVProgressHUD.showError(withStatus: message)
    }
    
    // dissmiss indictor
    func dismiss(){
        SVProgressHUD.dismiss()
    }
    
    func dismiss(with delay:TimeInterval){
        SVProgressHUD.dismiss(withDelay: delay)
    }
}
