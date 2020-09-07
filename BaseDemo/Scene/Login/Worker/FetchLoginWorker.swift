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

struct UpdateLoginAction: Action {
    var login : LoginObj?
}

class FetchLoginWorker: AsyncLoginWorker {
    
    typealias T = LoginObj
    
    func executeLogin(username: String, password: String) -> Promise<LoginObj> {
        
        return Networking.shared.fetchLoginAuthentication(with: username, password: password).then {
            (loginObj) -> Promise<LoginObj> in
            
            // Dispatch action '
            let action = UpdateLoginAction(login: loginObj)
            
            mainStore.dispatch(action)
            
            return Promise.value(loginObj)
        }

    }
    
}
