//
//  TicketObj.swift
//  BaseDemo
//
//  Created by macOS on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import ObjectMapper

class TicketObj : BaseObj {
    var name : String?
    
    // Mappable
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        name <- map[Constants.Obj.Repo.Name]
    }
}
