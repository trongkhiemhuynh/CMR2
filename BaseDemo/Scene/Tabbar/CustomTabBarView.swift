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
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    
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
    
    func deactiveTab(tab: Int) {
        
        //        let btn = viewWithTag(tab) as? UIButton
        //        btn?.setTitleColor(Color.TextTitleColor, for: .normal)
        switch tab {
        case 0:
            lbl1.textColor = Color.TextTitleColor
            btn1.imageView?.image = UIImage(named: "home_unselect_1")
        case 1:
            lbl2.textColor = Color.TextTitleColor
            btn2.imageView?.image = UIImage(named: "menu_unselect_1")
        case 2:
            lbl3.textColor = Color.TextTitleColor
            btn3.imageView?.image = UIImage(named: "search_unselect_1")
        case 3:
            lbl4.textColor = Color.TextTitleColor
            btn4.imageView?.image = UIImage(named: "noti_unselect_1")
        case 4:
            lbl5.textColor = Color.TextTitleColor
            btn5.imageView?.image = UIImage(named: "personal_unselect_1")
        default:
            print("out of range")
        }
    }
    
    func activateTab(tab : Int) {
        print("---",#function)
        //        var strName : String
        //
        switch tab {
        case 0:
            lbl1.textColor = Color.MainAppColor()
            btn1.setImage(UIImage(named: "home_select_1"), for: .normal)
        case 1:
            lbl2.textColor = Color.MainAppColor()
            btn2.setImage(UIImage(named: "menu_select_1"), for: .normal)
        case 2:
            lbl3.textColor = Color.MainAppColor()
            btn3.setImage(UIImage(named: "search_select_1"), for: .normal)
        case 3:
            lbl4.textColor = Color.MainAppColor()
            btn4.setImage(UIImage(named: "notification_select_1"), for: .normal)
        case 4:
            lbl5.textColor = Color.MainAppColor()
            btn5.imageView?.image = UIImage(named: "personal_select_1")
            //        case 5:
            //            lbl1.textColor = Color.MainAppColor()
        //            btn1.tintColor = Color.MainAppColor()
        default:
            print("out of range")
        }
        
        activeItem = tab
        itemTapped!(tab)
    }
}

extension CustomTabBarView: XibInitalization {
    typealias Element = CustomTabBarView
}
