//
//  LoginPresenter.swift
//  BaseDemo
//
//  Created by macOS on 9/3/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol LoginPresenterOutput : class {
    func presentError(_ error: Error)
    func updateView()
}

class LoginPresenter {
    /// Output
    var output : LoginPresenterOutput?
    private let disposeBag = DisposeBag()
    
    fileprivate var loginObj: BehaviorRelay<LoginObj> {
        return mainStore.state.loginState!.loginObj
    }
    
    init() {
        // Obser
        self.loginObj.asObservable().subscribe {[unowned self] (loginObj) in
            // Reload
            
            Logger.info(loginObj)
            self.output?.updateView()
            
        }.disposed(by: self.disposeBag)
    }
}

extension LoginPresenter : LoginInteractorOutput {
    
    func presentError(_ error: Error) {
        output?.presentError(error)
    }
    
}
