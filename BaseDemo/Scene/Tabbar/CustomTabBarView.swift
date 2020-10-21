//
//  CustomTabBarView.swift
//  BaseDemo
//
//  Created by khiemht on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

//enum TabbarMenu: String {
//    case home = "Home"
//    case menu = "Menu"
//    case search = "Search"
//    case notification = "Notification"
//    case personal = "Personal"
//}

class CustomTabBarView: UIView {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var vContent: UIView!
    
//    var arrMenu: [UIButton]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
        
    }
    
    var itemTapped: ((_ tab : Int) -> Void)?
    var activeItem: Int = 0
    
    @IBAction func tappedButton(_ sender : UIButton) {
        switchTab(from: self.activeItem, to: sender.tag)
    }
    
    func switchTab(from: Int, to: Int) {
        
        if from != to {
            deactiveTab(tab: from)
            activateTab(tab: to)
        } else {
            itemTapped!(999)
        }
        
        layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    func setupView() {
        vContent.backgroundColor = .gray
        vContent.clipsToBounds = true
        
//        btnHome.centerButtonAndImageWithSpacing(spacing: 8.0)
//        btnProfile.centerButtonAndImageWithSpacing(spacing: 8.0)
//        btnTicket.centerButtonAndImageWithSpacing(spacing: 8.0)
//        btnSetting.centerButtonAndImageWithSpacing(spacing: 8.0)
//
//        arrMenu = [btnHome, btnProfile, btnTicket, btnSetting]
        activateTab(tab: activeItem)
    }
    
    func deactiveTab(tab : Int) {
        
        let btn = viewWithTag(tab) as? UIButton
        btn?.setTitleColor(Color.TextTitleColor, for: .normal)
        
//        btn?.setTitle("", for: .normal)
        
//        switch tab {
//        case 0:
//            btnHome.setImage(UIImage(named: "home"), for: .normal)
//            btnHome.setTitle("", for: .normal)
//        case 1:
//            btn?.setImage(UIImage(named: "profile"), for: .normal)
//        case 2:
//            btn?.setImage(UIImage(named: "ticket"), for: .normal)
//        case 3:
//            btn?.setImage(UIImage(named: "setting"), for: .normal)
//        default:
//            btn?.setImage(UIImage(named: "home"), for: .normal)
//        }
    }
    
    func activateTab(tab : Int) {
        print("---",#function)
//        var strName : String
//
//        switch tab {
//        case 0:
//            strName = "Home"
//            btnHome.setTitle(strName, for: .normal)
//            btnHome.setTitleColor(Color.MainAppColor(), for: .normal)
//            btnHome.setImage(UIImage(named: "\(strName.lowercased())_selected"), for: .normal)
//        case 1:
//            strName = "Profile"
//
//        case 2:
//            strName = "Ticket"
//        case 3:
//            strName = "Setting"
//        default:
//            strName = "Home"
//        }
        
        let btn = viewWithTag(tab) as? UIButton
        
//        btn?.setTitle(strName, for: .normal)
        btn?.setTitleColor(Color.MainAppColor(), for: .normal)
//        btn?.setImage(UIImage(named: "\(strName.lowercased())_selected"), for: .normal)
        
        activeItem = tab
        itemTapped!(tab)
    }
}

extension CustomTabBarView: XibInitalization {
    typealias Element = CustomTabBarView
}
