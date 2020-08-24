//
//  CustomTabBarView.swift
//  BaseDemo
//
//  Created by khiemht on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomTabBarView: BaseView {

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var btnHome : UIButton!
    @IBOutlet weak var btnProfile : UIButton!
    @IBOutlet weak var btnTicket : UIButton!
    @IBOutlet weak var btnSetting : UIButton!
    
    var arrMenu : [UIButton]!
    
    @IBAction func tappedButton(_ sender : UIButton) {
        
        sender.isSelected = true
        
        updateStatusMenu()

    }
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomTabBarView", owner: self, options: nil)
        addSubview(vContent)
        vContent.frame = self.bounds
        
        
        btnHome.centerButtonAndImageWithSpacing(spacing: 8.0)
        btnProfile.centerButtonAndImageWithSpacing(spacing: 8.0)
        btnTicket.centerButtonAndImageWithSpacing(spacing: 8.0)
        btnSetting.centerButtonAndImageWithSpacing(spacing: 8.0)
        
        // set color button
        
        
        
        btnHome.isSelected = true
        
        arrMenu = [btnHome, btnProfile, btnTicket, btnSetting]
        
     
        updateStatusMenu()
    }
    
    func updateStatusMenu() {

        for btn in arrMenu {
            
            print("debug --- \(btn.titleLabel?.text) -- \(btn.isSelected)")
            
            if (btn.isSelected) {
                
                var strName : String
                
                switch btn.tag {
                case 0:
                    strName = "Home"
                case 1:
                    strName = "Profile"
                case 2:
                    strName = "Ticket"
                case 3:
                    strName = "Setting"
                default:
                    strName = "Home"
                }
                
                btn.setTitle(strName, for: .normal)
                btn.setTitleColor(BASEColor.MainAppColor(), for: .normal)
                btn.setImage(UIImage(named: "\(strName.lowercased())_selected"), for: .normal)
                
                btn.isSelected = false
                
                NotificationCenter.default.post(name: .TabbarName, object: nil, userInfo: ["name":strName])
                
            } else {
                btn.setTitle("", for: .normal)
                
                switch btn.tag {
                case 0:
                    btn.setImage(UIImage(named: "home"), for: .normal)
                case 1:
                    btn.setImage(UIImage(named: "profile"), for: .normal)
                case 2:
                    btn.setImage(UIImage(named: "ticket"), for: .normal)
                case 3:
                    btn.setImage(UIImage(named: "setting"), for: .normal)
                default:
                    btn.setImage(UIImage(named: "home"), for: .normal)
                }
                
            }
            
//            btn.layoutIfNeeded()
        }
        
    }
    

}
