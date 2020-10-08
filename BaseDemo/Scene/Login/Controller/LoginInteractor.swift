//
//  LoginInteractor.swift
//  BaseDemo
//
//  Created by macOS on 9/3/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

protocol LoginInteractorOutput : class {
    func presentError(_ error : Error)
}

class LoginInteractor {
    /// Output
    var output : LoginInteractorOutput?
    
    fileprivate lazy var fetchLoginWorker : FetchLoginWorker = {
        return FetchLoginWorker()
    }()
}

extension LoginInteractor : LoginControllerOutput {
    //network
    func fetchAuthentication(username: String, password: String) {
        fetchLoginWorker.executeLogin(username: username, password: password)
            .catch { error in
                self.output?.presentError(error)
        }
    }
    
}
