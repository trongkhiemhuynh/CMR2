//
//  FetchLoginWorker.swift
//  BaseDemo
//
//  Created by macOS on 9/3/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import PromiseKit
import ReSwift
import RealmSwift

struct UpdateLoginAction: Action {
    var login : LoginObj?
}

class FetchLoginWorker: AsyncLoginWorker {
    
    typealias T = LoginObj
    
    func executeLogin(username: String, password: String) -> Promise<LoginObj> {
        
        return Networking.shared.fetchLoginAuthentication(with: username, password: password).then {
            (loginObj) -> Promise<LoginObj> in
            
            //save to realm
            let realm = try! Realm()
            try! realm.write {
                let login = realm.create(LoginObject.self)
                login.name = loginObj.name!
                login.token = loginObj.token!
                login.tenant = loginObj.tenant!
                //log
                Logger.info(login)
                realm.add(login)
            }
            
            
            // Dispatch action '
            let action = UpdateLoginAction(login: loginObj)
            
            mainStore.dispatch(action)
            
            return Promise.value(loginObj)
        }

    }
    
}
