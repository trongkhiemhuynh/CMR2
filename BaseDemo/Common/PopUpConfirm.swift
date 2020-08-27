//
//  PopUpConfirm.swift
//  BaseDemo
//
//  Created by macOS on 8/27/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class PopUpConfirm: UIView {

    @IBOutlet weak var btnOk : UIButton!
    @IBOutlet weak var btnCancel : UIButton!
    
    
    @IBAction func actionOk() {
        print(#function)
        removeFromSuperview()
    }
    
    @IBAction func actionCancel() {
        print(#function)
        removeFromSuperview()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
