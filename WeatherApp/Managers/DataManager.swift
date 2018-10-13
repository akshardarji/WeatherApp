//
//  DataManager.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    var annotationsLists : [Annotation]?

    init() {
        setupDataManager()
    }
    
    func setupDataManager() {
        annotationsLists = Array()
        let plistPath = weatherLocationsPlistPath()
        if let plistDataArray = NSArray(contentsOfFile: plistPath) {
            for annotationDict in plistDataArray {
                let annotation = Annotation(withDictionary: annotationDict as! NSDictionary)
                addAnnotation(annotation: annotation)
            }
        }
    }
    
    func weatherLocationsPlistPath() -> String {
        return WeatherUtility.shared.documentDirectoryPath() + "/weatherLocations.plist"
    }
    
}


extension DataManager {
    /// Adding Annotation Points
    func addAnnotation(annotation: Annotation) -> Void {
        annotationsLists?.append(annotation)
        saveData()
    }
    
    /// Removing Annotation Points
    func removeAnnotation(index: Int) -> Void {
        guard index < (annotationsLists?.count)! else {
            return
        }
        annotationsLists?.remove(at: index)
        saveData()
    }
    
    /// Saving Annotation Points
    func saveData() -> Void {
        guard annotationsLists != nil && (annotationsLists?.count)! > 0 else {
            return
        }
        
        let array = NSMutableArray()
        for annotation in annotationsLists! {
            let dict = annotation.dictionaryCreation()
            array.add(dict)
        }
        
        let plistPath = weatherLocationsPlistPath()
        let _ = array.write(toFile: plistPath, atomically: true)
        
    }
    
    /// Reset Annotation Points File
    func ResetData() -> Void {
        let array = NSMutableArray()
        annotationsLists?.removeAll()
        let plistPath = weatherLocationsPlistPath()
        let _ = array.write(toFile: plistPath, atomically: true)
    }
}

