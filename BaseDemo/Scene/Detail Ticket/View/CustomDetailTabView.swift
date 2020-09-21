//
//  CustomDetailTabView.swift
//  BaseDemo
//
//  Created by khiemht on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

enum TabOption: String {
    case info = "Ticket details"
    case activities = "Activities"
}

protocol TabViewOutput: class {
    func onTab(_ tab: TabOption)
}

class CustomDetailTabView: BaseView {
    
    /// outlet
    @IBOutlet weak var vInfo : UIView!
    @IBOutlet weak var vActivity : UIView!
    
    @IBOutlet weak var lblTicketDetail : UILabel!
    @IBOutlet weak var lblActivity : UILabel!
    @IBOutlet weak var ivInfoStatus : UIImageView!
    @IBOutlet weak var ivActivitiesStatus : UIImageView!
    
    //delegate
    weak var delegate: TabViewOutput?
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomDetailTabView", owner: self, options: nil)
        addSubview(vContent)
        vContent.frame = self.bounds
        vContent.backgroundColor = BASEColor.BackgroundListColor()
        
        updateStatus(.info)
        
        vInfo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapInfo(gesture:))))
        vActivity.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapActivity(gesture:))))
    }
    
    @objc func handleTapInfo(gesture: UITapGestureRecognizer) {
//        NotificationCenter.default.post(name: .DetailTicketTab, object: nil, userInfo: ["action":"0"])
        delegate?.onTab(.info)
        updateStatus(.info)
    }
    
    @objc func handleTapActivity(gesture: UITapGestureRecognizer) {
//        NotificationCenter.default.post(name: .DetailTicketTab, object: nil, userInfo: ["action":"1"])
        delegate?.onTab(.activities)
        updateStatus(.activities)
    }
    
    func updateStatus(_ tab: TabOption) {
        
        ivInfoStatus.isHidden = !ivInfoStatus.isHidden
        ivActivitiesStatus.isHidden = !ivInfoStatus.isHidden
        
        switch tab {
        case .info:
            lblTicketDetail.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            lblActivity.font = UIFont.systemFont(ofSize: 15, weight: .light)
            ivInfoStatus.isHidden = false
            ivActivitiesStatus.isHidden = true
        case .activities:
            lblTicketDetail.font = UIFont.systemFont(ofSize: 15, weight: .light)
            lblActivity.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            ivActivitiesStatus.isHidden = false
            ivInfoStatus.isHidden = true
        }
        
    }
}
