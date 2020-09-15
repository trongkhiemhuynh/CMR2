//
//  Profile.swift
//  BaseDemo
//
//  Created by macOS on 9/15/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import RealmSwift

class Profile : Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var address: String = ""
}
