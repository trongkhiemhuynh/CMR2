//
//  LoginConfiguration.swift
//  BaseDemo
//
//  Created by macOS on 9/3/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

class LoginConfiguration {
    static let shared = LoginConfiguration()
    
    /// Description
    /// - Parameter viewController: viewController description
    func configure(viewController : LoginController) {
        
        /// Presenter
        let presenter = LoginPresenter()
        presenter.output = viewController
        
        /// Interactor
        let interactor = LoginInteractor()
        interactor.output = presenter
        
        //  ViewController
        viewController.output = interactor
        
        Logger.info("khiemht debug - \(presenter) - \(interactor) - \(viewController)")
    }
}
