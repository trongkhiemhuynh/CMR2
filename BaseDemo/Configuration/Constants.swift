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

let heightTabbar: CGFloat = 67.0
let delayTime: Double = 0.35

struct Constants {
    struct App {
        
        static let isHTTPS = true
        
        static let BaseURL : String = {
            if Constants.App.isHTTPS {
                return "https://103.39.93.202/api"
            } else {
                return "http://10.189.189.72:8000/api"
            }
        }()
        
    }
    
    struct APIEndPoint {
        static let Login = "/login/"
        static let Tenant = "/tenants/"
        static let Menu = "/menu"
        static let CheckToken = "/check-token"
        static let Menu_ListView = "/object/view"
        static let CreatedForm = "/object/load-form-create"
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
