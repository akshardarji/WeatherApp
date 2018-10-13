//
//  BaseViewController.swift
//  Skinquiry
//
//  Created by Akshar Darji on 4/09/18.
//  Copyright © 2018 Codal. All rights reserved.
//

import UIKit
import Foundation

class ConsultationBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  self.view.backgroundColor = UIColor(hex: "#2D2D2D")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppShared.consultationShared.consultationView?.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.frame = UIScreen.main.bounds
        AppShared.consultationShared.consultationView?.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

