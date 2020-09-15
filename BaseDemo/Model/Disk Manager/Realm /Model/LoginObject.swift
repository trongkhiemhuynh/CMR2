//
//  LoginObject.swift
//  BaseDemo
//
//  Created by macOS on 9/15/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import RealmSwift

class LoginObject : Object {
    @objc dynamic var token = ""
    @objc dynamic var name = ""
    @objc dynamic var tenant = ""
    
//    override class func primaryKey() -> String? {
//        
//    }
}
