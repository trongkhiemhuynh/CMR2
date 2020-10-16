//
//  RealmManager.swift
//  BaseDemo
//
//  Created by macOS on 10/15/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    private init() {}
    
    func onModifiedObject(object: Object) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(object, update: .modified)
        }
    }
    
    func onGetLoginObject() -> Object? {
        
        let realm = try! Realm()
        
        let obj = realm.objects(LoginObject.self)
        Logger.info(obj)

        return obj.first
    }
    
    func onGetValue(with key: String) -> String? {
        let realm = try! Realm()
        let objs = realm.objects(MenuObject.self)
        
        for obj in objs {
            if obj.key == key {
                return obj.value
            }
        }
        
        return nil
    }
}
