//
//  CustomDetailTabView.swift
//  BaseDemo
//
//  Created by khiemht on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomDetailTabView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var vInfo : UIView!
    @IBOutlet weak var vActivity : UIView!
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomDetailTabView", owner: self, options: nil)
        addSubview(vContent)
        vContent.frame = self.bounds
        vContent.backgroundColor = UIColor(hex: BASEColor.BACKGROUND_LIST_COLOR)
        
        print("debug123 - \(vContent.frame)")
        
        vInfo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapInfo(gesture:))))
        vActivity.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapActivity(gesture:))))
    }
    
    @objc func handleTapInfo(gesture: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: .DetailTicketTab, object: nil, userInfo: ["action":"0"])
    }
    
    @objc func handleTapActivity(gesture: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: .DetailTicketTab, object: nil, userInfo: ["action":"1"])
    }
}
