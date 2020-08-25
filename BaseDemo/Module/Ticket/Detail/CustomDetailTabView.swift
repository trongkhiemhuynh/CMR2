//
//  CustomDetailTabView.swift
//  BaseDemo
//
//  Created by khiemht on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

enum TabDetailOption : String {
    case ticket_detail = "Ticket details"
    case activities = "Activities"
}

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
    
    @IBOutlet weak var lblTicketDetail : UILabel!
    @IBOutlet weak var lblActivity : UILabel!
    @IBOutlet weak var imgTicketDetail : UIImageView!
    @IBOutlet weak var imgActivity : UIImageView!
    
//    var selectedItem: TabDetailOption?
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomDetailTabView", owner: self, options: nil)
        addSubview(vContent)
        vContent.frame = self.bounds
        vContent.backgroundColor = BASEColor.BackgroundListColor()
        
//        selectedItem = .ticket_detail
        
        updateStatus(tab: .ticket_detail)
        
        vInfo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapInfo(gesture:))))
        vActivity.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapActivity(gesture:))))
    }
    
    @objc func handleTapInfo(gesture: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: .DetailTicketTab, object: nil, userInfo: ["action":"0"])
        updateStatus(tab: .ticket_detail)
    }
    
    @objc func handleTapActivity(gesture: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: .DetailTicketTab, object: nil, userInfo: ["action":"1"])
        updateStatus(tab: .activities)
    }
    
    func updateStatus(tab : TabDetailOption) {
        
        let strTabName = tab.rawValue
        
        imgTicketDetail.isHidden = !imgTicketDetail.isHidden
        imgActivity.isHidden = !imgTicketDetail.isHidden
        
        switch  strTabName {
        case lblTicketDetail.text:
            lblTicketDetail.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            lblActivity.font = UIFont.systemFont(ofSize: 15, weight: .light)
            
        case lblActivity.text:
            lblTicketDetail.font = UIFont.systemFont(ofSize: 15, weight: .light)
            lblActivity.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            
        default:
            print("default")
        }
        
    }
}
