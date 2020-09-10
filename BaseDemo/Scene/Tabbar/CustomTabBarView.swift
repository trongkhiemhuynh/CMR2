//
//  CustomTabBarView.swift
//  BaseDemo
//
//  Created by khiemht on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomTabBarView: UIView {
    
    @IBOutlet weak var btnHome : UIButton!
    @IBOutlet weak var btnProfile : UIButton!
    @IBOutlet weak var btnTicket : UIButton!
    @IBOutlet weak var btnSetting : UIButton!
    @IBOutlet weak var vContent : UIView!
    
    var arrMenu : [UIButton]!
    
    var itemTapped : ((_ tab : Int) -> Void)?
    var activeItem : Int = 0
    
    @IBAction func tappedButton(_ sender : UIButton) {
        print("---",#function)
        switchTab(from: self.activeItem, to: sender.tag)
    }
    
    func switchTab(from: Int, to: Int) {
        print("---",#function)
        deactiveTab(tab: from)
        activateTab(tab: to)
        
        layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("-------",#function,String(describing: self))
        
        setupView()
    }
    
    func setupView() {
        print("-------",vContent.frame, #function)
        vContent.layer.cornerRadius = 12
        vContent.backgroundColor = .white
        vContent.clipsToBounds = true
        
        btnHome.centerButtonAndImageWithSpacing(spacing: 8.0)
        btnProfile.centerButtonAndImageWithSpacing(spacing: 8.0)
        btnTicket.centerButtonAndImageWithSpacing(spacing: 8.0)
        btnSetting.centerButtonAndImageWithSpacing(spacing: 8.0)
        
        arrMenu = [btnHome, btnProfile, btnTicket, btnSetting]
        
        activateTab(tab: activeItem)

    }
    
    func deactiveTab(tab : Int) {
        print("---",#function)
        let btn = viewWithTag(tab) as? UIButton
        
        btn?.setTitle("", for: .normal)
        
        switch tab {
        case 0:
            // MARK: -FIXME
            btnHome.setImage(UIImage(named: "home"), for: .normal)
            btnHome.setTitle("", for: .normal)
        case 1:
            btn?.setImage(UIImage(named: "profile"), for: .normal)
        case 2:
            btn?.setImage(UIImage(named: "ticket"), for: .normal)
        case 3:
            btn?.setImage(UIImage(named: "setting"), for: .normal)
        default:
            btn?.setImage(UIImage(named: "home"), for: .normal)
        }
    }
    
    func activateTab(tab : Int) {
        print("---",#function)
        var strName : String
        
        switch tab {
        case 0:
            strName = "Home"
            btnHome.setTitle(strName, for: .normal)
            btnHome.setTitleColor(BASEColor.MainAppColor(), for: .normal)
            btnHome.setImage(UIImage(named: "\(strName.lowercased())_selected"), for: .normal)
        case 1:
            strName = "Profile"
            
        case 2:
            strName = "Ticket"
        case 3:
            strName = "Setting"
        default:
            strName = "Home"
        }
        
        let btn = viewWithTag(tab) as? UIButton
        
        btn?.setTitle(strName, for: .normal)
        btn?.setTitleColor(BASEColor.MainAppColor(), for: .normal)
        btn?.setImage(UIImage(named: "\(strName.lowercased())_selected"), for: .normal)
        
        activeItem = tab
        itemTapped!(tab)
    }
}

extension CustomTabBarView : XibInitalization {
    typealias Element = CustomTabBarView
}
