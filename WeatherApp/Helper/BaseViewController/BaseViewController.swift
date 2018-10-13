//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let window = UIApplication.shared.keyWindow
    
    /// Get Top Most View Controller in Navigation Stack
    var topviewController : UIViewController? {
        get{
            return (AppConst.appDelegate.window?.rootViewController as? UINavigationController)?.topViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#EBEBEB")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
