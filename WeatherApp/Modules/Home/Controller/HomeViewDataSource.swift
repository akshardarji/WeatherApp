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
        if isSearchModeOn {
            return (searchResult.count)
        }
        else {
            guard (DataManager.shared.annotationsLists != nil && (DataManager.shared.annotationsLists!.count) > 0) else {
                return 0
            }
            return (DataManager.shared.annotationsLists!.count)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityListTableViewCell.reuseIdentifier, for: indexPath) as! CityListTableViewCell
        cell.selectionStyle = .none
        if isSearchModeOn {
            let annotationData = searchResult[indexPath.row]
            cell.cityLabel.text = (annotationData.locality ?? "") + ", " + (annotationData.country ?? "")
        }
        else {
            let annotationData = DataManager.shared.annotationsLists![indexPath.row]
            cell.cityLabel.text = (annotationData.locality ?? "") + ", " + (annotationData.country ?? "")
        }
        
        return cell
    }
}


extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherDetailVC = WeatherDetailViewController.instantiateFrom(appStoryboard: .Main)
        weatherDetailVC.annotation = isSearchModeOn ? searchResult[indexPath.row] : DataManager.shared.annotationsLists?[indexPath.row]
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
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let searchBar = UISearchBar.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        return searchBar
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchKeyword = ""
        isSearchModeOn = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchKeyword = nil
        isSearchModeOn = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchKeyword = searchText
        let filterData = DataManager.shared.annotationsLists?.filter { annotation in
            return annotation.locality?.lowercased().range(of: searchText.lowercased()) != nil
        }
       
        searchResult.removeAll()
        
        guard (filterData != nil && (filterData?.count)! > 0) else {
            if searchText == "" {
                searchResult.append(contentsOf: DataManager.shared.annotationsLists!)
            }
            tblView.reloadData()
            return
        }
        
        searchResult.append(contentsOf: filterData!)
        tblView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearchModeOn = false
        tblView.reloadData()
    }
}
