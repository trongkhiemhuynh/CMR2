//
//  LoginObj.swift
//  BaseDemo
//
//  Created by macOS on 9/3/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginObj : Mappable {
    required init?(map: Map) {
        
    }
    
    /// Description
    /// - Parameter map:
    func mapping(map: Map) {
        self.name <- map[Constants.Obj.Login.name]
        self.tenant <- map[Constants.Obj.Login.tenant]
        self.token <- map[Constants.Obj.Login.token]
    }
    
    var name : String?
    var token : String?
    var tenant : String?
    
}
