//
//  HomeViewDataSource.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard (DataManager.shared.annotationsLists != nil && (DataManager.shared.annotationsLists!.count) > 0) else {
            return 0
        }
        return (DataManager.shared.annotationsLists!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityListTableViewCell.reuseIdentifier, for: indexPath) as! CityListTableViewCell
        cell.selectionStyle = .none
        let annotationData = DataManager.shared.annotationsLists![indexPath.row]
        cell.cityLabel.text = (annotationData.locality ?? "") + ", " + (annotationData.country ?? "")
        return cell
    }
}


extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherDetailVC = WeatherDetailViewController.instantiateFrom(appStoryboard: .Main)
        weatherDetailVC.annotation = DataManager.shared.annotationsLists?[indexPath.row]
        self.navigationController?.pushViewController(weatherDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        DataManager.shared.removeAnnotation(index: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
