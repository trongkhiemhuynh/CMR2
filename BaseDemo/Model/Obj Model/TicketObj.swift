//
//  TicketObj.swift
//  BaseDemo
//
//  Created by macOS on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import ObjectMapper

class TicketObj : Mappable {
    required init?(map: Map) {
    
    }
    
    var usrName : String?
    var usrID : String?
    var usrTitleStatus : String?
    
    // Mappable
    func mapping(map: Map) {
//        super.mapping(map: map)
        
        usrName         <- map[Constants.Obj.Ticket.UserName]
        usrID           <- map[Constants.Obj.Ticket.UserId]
        usrTitleStatus  <- map[Constants.Obj.Ticket.UserTitleStatus]
    }
}
