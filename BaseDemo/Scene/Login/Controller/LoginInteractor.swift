//
//  LoginInteractor.swift
//  BaseDemo
//
//  Created by macOS on 9/3/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

protocol LoginInteractorOutput : class {
    func interatorError(_ error : Error)
}

class LoginInteractor {
    /// Output
    weak var output : LoginInteractorOutput?
}

extension LoginInteractor : LoginControllerOutput {
    
    func fetchAuthentication() {
        
    }
    
}
