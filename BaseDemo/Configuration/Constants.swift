//
//  Constants.swift
//  BaseDemo
//
//  Created by khiemht on 8/30/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import UIKit

let heightScreen = UIScreen.main.bounds.size.height
let widthScreen = UIScreen.main.bounds.size.width

var tabBarHeight: CGFloat = 70.0

struct Constants {
    struct App {
        
        static let isHTTPS = false
        
        static let BaseURL : String = {
            if Constants.App.isHTTPS {
                return "https://172.23.90.170:8000/api"
            } else {
                return "http://172.23.90.170:8000/api"
            }
        }()
        
    }
    
    struct APIEndPoint {
        static let Login = "/login/"
        static let Tenant = "/tenants/"
    }
    
    // MARK:
    // MARK: Feels Object
    /// Declear OBJ
    struct Obj {
        
        // MARK: Login
        struct Login {
            static let tenant = "Tenant"
            static let name = "Name"
            static let token = "Token"
        }
        
        // MARK: Ticket
        struct Ticket {
            static let UserTitleStatus = "status"
            static let UserName = "name"
            static let UserId = "id"
        }
    }
}
