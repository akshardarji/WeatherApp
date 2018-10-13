////
////  ConsulationViewBaseVC.swift
////  Skinquiry
////
////  Created by Bilal Ghanchi on 8/16/18.
////  Copyright © 2018 Codal. All rights reserved.
////
//
//import Foundation
import UIKit
import SwiftMessages

// Consultation View handle
extension BaseViewController {
    
    internal func addConsulationView(){
        switch consulationsShared.consultationState {
            
        case .started, .finding, .stopped:
            consulationViewOperation()
            
        case .other:
            resetView()
        }
    }
    
    /* function is used to add consultation view when error message appeared on top of screen
     then it will take delay of 3.0 sec else it will take 0.0 sec delay and perform action */
    private func consulationViewOperation(){
        
        if AppConst.isOnline {
            
            let window = UIApplication.shared.keyWindow!
            let views = window.subviews
            var delay = 0.0
            
            for view in views {
                if view is PassthroughView {
                    delay = 3.0
                }
            }
            
            //perform adding consultation view based on delay.
            self.perform(#selector(self.updateConsulationView), with:nil, afterDelay: delay)
            
        }
    }
    
    //func used to add view using animation of 0.5 sec.
    @objc func updateConsulationView() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: .curveEaseIn,
            animations: {
                self.addConsultationView()
                self.adjustViewSize(setYPoint: ConsultationManager.shared.getCunsultationViewTopHight())
                self.view.layoutIfNeeded()
                
        },
            completion: nil)
    }
    
    fileprivate func addConsultationView() {
        guard !ConsultationManager.shared.isConsultationViewAdded else {
            consulationsShared.consultationView?.isHidden = false
            consulationsShared.consultationView?.consultaionTextLable?.text = consulationsShared.consultationState.title
            window?.bringSubview(toFront: consulationsShared.consultationView!)
            return
        }
        consulationsShared.consultationView = ConsultationTopBarView(frame: CGRect(x: 0, y: ConsultationManager.shared.getViewAdjustSize().viewYPosision, width: UIScreen.main.bounds.width, height: ConsultationManager.shared.getViewAdjustSize().viewHight))
        consulationsShared.consultationView?.delegate = consulationsShared
        window?.addSubview(consulationsShared.consultationView!)
        window?.backgroundColor = UIColor(hex: "#2D2D2D")
        
        consulationsShared.consultationView?.consultaionTextLable?.text = consulationsShared.consultationState.title
        ConsultationManager.shared.isConsultationViewAdded = true
    }
    
    fileprivate func adjustViewSize(setYPoint :CGFloat){
        UIApplication.topViewController()?.view.frame = CGRect(x: 0, y: setYPoint, width: UIApplication.topViewController()!.view.frame.width, height:  UIScreen.main.bounds.height - (setYPoint))
    }
    
    func resetView() {
        guard ConsultationManager.shared.isConsultationViewAdded else {
            return
        }
        consulationsShared.consultationView?.removeFromSuperview()
        let yPosition:CGFloat = UIDevice.isIphoneX ? 35.0 : ConsultationManager.shared.getViewAdjustSize().viewYPosision
        topviewController?.view.frame = CGRect(x: 0, y: yPosition, width: topviewController!.view.frame.width, height: topviewController!.view.frame.height + ConsultationManager.shared.getCunsultationViewTopHight())
        self.viewDidLayoutSubviews()
    }
}
