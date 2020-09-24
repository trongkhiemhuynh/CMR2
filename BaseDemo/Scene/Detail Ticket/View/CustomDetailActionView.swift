//
//  CustomActionDetailView.swift
//  BaseDemo
//
//  Created by khiemht on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomDetailActionView: BaseView {
    
    /// outlet
    @IBOutlet weak var vCustom: UIView!
    @IBOutlet weak var vPost: UIView!
    @IBOutlet weak var vLogCall: UIView!
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var btnLogCall: UIButton!
    
    /// variable
    var popupView : PopupView?

    override func commonInit() {
        Bundle.main.loadNibNamed("CustomDetailActionView", owner: self, options: nil)
        addSubview(vContent)
        vContent.frame = self.bounds
    }
    
    @IBAction func onTap(_ sender: UIButton) {
        print(#function)
        if sender == btnPost {
            //RouterManager.shared.handleRouter(PostRoute())
            let extendRoute = ExtendRoute()
            RouterManager.shared.handleRouter(extendRoute)
            
            extendRoute.handleData { (controller) in
                controller.extendedType = .email
            }
        } else {
            //logcall
            RouterManager.shared.handleRouter(LogCallRoute())
        }
    }

    @IBAction func actionMore() {
        popupView = PopupView.xibInstance()
        popupView?.frame = CGRect(x: 0, y: 0, width: widthScreen, height: heightScreen)
        
        self.superview?.addSubview(popupView!)
        
        UIView.animate(withDuration: 0.35, delay: 0, options: .transitionFlipFromBottom, animations: {
            self.superview?.setNeedsLayout()
        }) { (success) in
            print(success)
        }
    }
    
    @IBAction func actionEdit() {
        
        let newVC = NewTicketViewController()

        let topViewController = UIApplication.getTopViewController()
        topViewController?.navigationController?.pushViewController(newVC, animated: true)
    }
    
}
