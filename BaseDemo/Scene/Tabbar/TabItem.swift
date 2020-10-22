//
//  TabItem.swift
//  BaseDemo
//
//  Created by khiemht on 8/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

import UIKit
enum TabItem: String, CaseIterable {
    case home = "Home"
    case menu = "Menu"
    case search = "Search"
    case notification = "Notification"
    case personal = "Personal"
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return UINavigationController(rootViewController: DashboardController())
        case .menu:
//            return UINavigationController(rootViewController: ProfileViewController())
            let controller = CustomMenuController()
            
            
//            let menu = MenuLeft.shared.onMenu()
        
//            controller.present(menu!, animated: true, completion: nil)
            return controller
        case .search:
            let searchView = UIView()
            let controller = UIViewController()
            let presenter = PresenterView.xibInstance()
            controller.view.addSubview(presenter)
            presenter.vContent.addSubview(searchView)
            
            presenter.frame = controller.view.bounds
            searchView.frame = presenter.vContent.bounds
//            searchView.backgroundColor = .red
            
            presenter.hideAddNewBtn(on: true)
            presenter.hideBackBtn(on: true)
            
            presenter.vTitle.lblTitle.text = "Search"

            let nav = UINavigationController(rootViewController: controller)
            nav.isNavigationBarHidden = true
            return nav
        case .notification:
            let notiView = NotificationView.xibInstance()
            let controller = UIViewController()
            let presenter = PresenterView.xibInstance()
            controller.view.addSubview(presenter)
            presenter.vContent.addSubview(notiView)

            notiView.frame = presenter.vContent.bounds
                
            presenter.frame = controller.view.bounds
            
            presenter.hideAddNewBtn(on: true)
            presenter.hideBackBtn(on: true)
            presenter.vTitle.lblTitle.text = "Notification"
            
            let nav = UINavigationController(rootViewController: controller)
            nav.isNavigationBarHidden = true
            return nav
        case .personal:
            let profileController = ProfileViewController.xibInstance()
            return UINavigationController(rootViewController: profileController)
        }
    }
    
    // these can be your icons
//    var icon: UIImage {
//        switch self {
//        case .dashboard:
//            return UIImage(named: "home_selected")!
//
//        case .profile:
//            return UIImage(named: "profile_selected")!
//        case .ticket:
//            return UIImage(named: "ticket_selected")!
//        case .setting:
//            return UIImage(named: "setting_selected")!
//        }
//    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
