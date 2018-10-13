//
//  UIImageView.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setWith(image url: String, placeHolder: UIImage) {
        if url != ""{
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url.toUrl, placeholder: placeHolder, options: nil, progressBlock: nil, completionHandler: nil)
        } else {
            self.image = placeHolder
        }
    }
}
