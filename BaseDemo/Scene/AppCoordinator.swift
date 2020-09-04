//
//  AppCoordinator.swift
//  BaseDemo
//
//  Created by macOS on 8/26/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator : Coordinator {
    
    let window : UIWindow?
    
    var rootViewController : UIViewController = {
       return LoginController()
    }()
    
    // MARK: - Coordinator
    init(window : UIWindow?) {
        self.window = window
    }
    
    override func start() {
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    override func finish() {
        
    }
}
