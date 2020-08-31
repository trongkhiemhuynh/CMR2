//
//  CustomActionDetailView.swift
//  BaseDemo
//
//  Created by khiemht on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomDetailActionView: BaseView {

    @IBOutlet weak var vCustom : UIView!
    var popupView : PopupView?
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func commonInit() {
        Bundle.main.loadNibNamed("CustomDetailActionView", owner: self, options: nil)
        addSubview(vContent)
        vContent.frame = self.bounds
    }
    
    // MARK: FIXME
    @IBAction func actionMore() {
        
        popupView = Bundle.main.loadNibNamed("PopupView", owner: self, options: nil)?.first as? PopupView
        
        popupView?.frame = CGRect(x: 0, y: 0, width: widthScreen, height: heightScreen)
        
        self.superview?.addSubview(popupView!)
        
        UIView.animate(withDuration: 0.35, delay: 0, options: .transitionFlipFromBottom, animations: {
            self.superview?.layoutIfNeeded()
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
