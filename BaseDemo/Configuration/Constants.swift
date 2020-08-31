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
        
        static let isHTTPS = true
        
        static let BaseURL : String = {
            if Constants.App.isHTTPS {
                return "https://"
            } else {
                return "http://"
            }
        }()
        
        
    }
    
    struct APIEndPoint {
        static let TicketList = "/ticket"
        static let Login = ""
    }
    
    // MARK:
    // MARK: Feels Object
    struct Obj {
        
        
        // MARK:
        // MARK: BASE
        static let CreatedAt = "created_at"
        static let UpdatedAt = "updated_at"
        static let ObjectId = "id"
        
        
        // MARK:
        // MARK: USER
        struct User {
            static let Name = "name"
            static let Username = "username"
            static let Email = "email"
        }
        
        
        // MARK:
        // MARK: Repo
        struct Repo {
            static let Name = "name"
        }
    }
    
    
}
