//
//  Common.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import UIKit

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

let heightScreen = UIScreen.main.bounds.size.height
let widthScreen = UIScreen.main.bounds.size.width

let arrInputTicket = ["Ticket owner","Ticket ID", "Phone", "Mail", "Priority", "Status", "Subject","Escalated ?", "Done ?","Date/Time opened","Date/Time closed","Created by..., date/time","Last modifined by..., date/time","Description"]

let arrIcTicket = ["ticketowner","ticket_id", "phone", "mail_ic", "priority", "status", "status","escalated", "done","date","date","createdby","createdby","description"]
