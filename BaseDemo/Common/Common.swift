//
//  Common.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

enum TabMenu : String {
    case Dashboard
    case Profile
    case Ticket
    case More
}

public extension Notification.Name {
    static let TabbarName = Notification.Name("TabbarName")
    static let StageName = Notification.Name("StageName")
    static let ChangeSort = Notification.Name("ChangeSort")
    static let UpdateSort = Notification.Name("UpdateSort")
    static let DetailTicket = Notification.Name("DetailTicket")
    static let DetailTicketTab = Notification.Name("DetailTicketTab")
}
