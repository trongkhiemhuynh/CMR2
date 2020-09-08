//
//  TicketRoute.swift
//  BaseDemo
//
//  Created by macOS on 9/8/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

class TicketRoute : Router {
    typealias Element = TicketViewController
    
    private lazy var _viewController : TicketViewController = {
        return TicketViewController.xibInstance()
    }()
    
    var viewController: TicketViewController {
        return _viewController
    }
    
    var routerType: RouterType {
        return .push
    }
}
