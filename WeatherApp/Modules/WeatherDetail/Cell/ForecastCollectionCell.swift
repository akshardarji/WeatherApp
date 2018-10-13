//
//  ForecastCollectionCell.swift
//  WeatherApp
//
//  Created by Akshar Darji on 12/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit

class ForecastCollectionCell: UICollectionViewCell , ReusableView , NibLoadableView {

    @IBOutlet var weatherImg : UIImageView!
    @IBOutlet var tempLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

}
