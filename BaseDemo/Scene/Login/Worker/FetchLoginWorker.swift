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

class FetchLoginWorker : AsyncWorker {
    
    typealias T = LoginObj
    
    func execute() -> Promise<T> {
        
        let fetch = Networking.shared.fetchLoginAuthentication(with: "", password: "").then {
            (loginObj) -> Promise<T> in
            
            return Promise()
        }
        
        return fetch
    }
}
