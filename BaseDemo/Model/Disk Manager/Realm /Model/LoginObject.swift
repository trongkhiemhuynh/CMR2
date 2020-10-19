//
//  LoginObject.swift
//  BaseDemo
//
//  Created by macOS on 9/15/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import RealmSwift

class LoginObject: Object {
    @objc dynamic var token = ""
    @objc dynamic var name = ""
    @objc dynamic var tenant = ""
    @objc dynamic var id = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

class MenuObject: Object {
    @objc dynamic var key = ""
    @objc dynamic var value = ""
    @objc dynamic var isSelected = false
    
    override class func primaryKey() -> String? {
        return "key"
    }
}
