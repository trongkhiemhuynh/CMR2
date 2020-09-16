//
//  AccountRoute.swift
//  BaseDemo
//
//  Created by macOS on 9/16/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

class AccountRoute : Router {
    typealias Element = AccountController
    
    var routerType: RouterType {
        return .push
    }
    
    fileprivate lazy var _viewController: AccountController = {
        return AccountController.xibInstance()
    }()

    var viewController: AccountController {
        return self._viewController
    }
}
