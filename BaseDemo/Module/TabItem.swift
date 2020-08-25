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
    case dashboard = "dashboard"
    case profile = "profile"
    case ticket = "ticket"
    case setting = "setting"
    
    
    var viewController: UIViewController {
        switch self {
        case .dashboard:
            
            return UINavigationController(rootViewController: TicketViewController())
        case .profile:
            return UINavigationController(rootViewController: DashboardViewController())
        case .ticket:
            return UINavigationController(rootViewController: TicketViewController())
        case .setting:
            return UINavigationController(rootViewController: TicketViewController())
        }
    }
    
    // these can be your icons
    var icon: UIImage {
        switch self {
        case .dashboard:
            return UIImage(named: "home_selected")!
            
        case .profile:
            return UIImage(named: "profile_selected")!
        case .ticket:
            return UIImage(named: "ticket_selected")!
        case .setting:
            return UIImage(named: "setting_selected")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
