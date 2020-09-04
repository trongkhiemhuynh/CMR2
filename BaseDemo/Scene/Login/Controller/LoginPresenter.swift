//
//  LoginPresenter.swift
//  BaseDemo
//
//  Created by macOS on 9/3/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

protocol LoginPresenterOutput : class {
    func presentError(_ error: Error)
}

class LoginPresenter {
    /// Output
    weak var output : LoginPresenterOutput?
}

extension LoginPresenter : LoginInteractorOutput {
    
    func presentError(_ error: Error) {
        output?.presentError(error)
    }
    
}
