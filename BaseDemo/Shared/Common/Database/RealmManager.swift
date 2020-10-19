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
    
    func onGetIDObject() -> String? {
        let realm = try! Realm()
        let objs = realm.objects(MenuObject.self)
        
        for obj in objs {
            if obj.isSelected == true {
                return obj.value
            }
        }
        
        return nil
    }
    
    func onUpdateSelectedObject(nameObject: String) {
        let realm = try! Realm()
        let objs = realm.objects(MenuObject.self)
        //            let o: MenuObject?
        
        for obj in objs {
            if obj.key == nameObject {
                
                try! realm.write {
                    obj.isSelected = true
                }
                
                break
            }
        }
    }
    
    func resetAllStateObject() {
        let realm = try! Realm()
        let objs = realm.objects(MenuObject.self)
        
        for obj in objs {
            obj.isSelected = false
            
            try! realm.write {
                realm.add(obj, update: .modified)
            }
        }
    }
    
}
