//
//  ViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/5/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import Alamofire
import SkyFloatingLabelTextField

protocol LoginControllerOutput {
    func fetchAuthentication(username: String, password: String)
}

class LoginController : BaseViewController {

    @IBOutlet weak var tfUserName: SkyFloatingLabelTextField!
    
    @IBOutlet weak var tfPassword: SkyFloatingLabelTextField!
    
    @IBOutlet weak var btnLogin : UIButton!
    
    @IBOutlet weak var btnCheckbox : UIButton!
    
    ///  MARK: - Output
    var output : LoginControllerOutput?
    
    var isCheck = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    override func setupView() {
        tfUserName.placeholder = "Username"
        tfUserName.title = "Username"
        
        tfPassword.placeholder = "Password"
        tfPassword.title = "Password"
        tfPassword.isSecureTextEntry = true
        btnLogin.layer.cornerRadius = 8
        
        let tapRecognization = UITapGestureRecognizer(target: self, action: #selector(self.tapDismiss(gesture:)))
        self.view.addGestureRecognizer(tapRecognization)
        
        let config = LoginConfiguration.shared
        config.configure(viewController : self)
    }
    
    @objc func tapDismiss(gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @IBAction func loginAction(_ sender : AnyObject) {
        if isCheck {
            updateView()
        } else {
            //show loading
//            didLoading()
            
            //fetch data
            output?.fetchAuthentication(username: tfUserName.text!, password: tfPassword.text!)
        }
    }
    
    @IBAction func actionCheck() {
        isCheck = !isCheck
        
        if (isCheck) {
            btnCheckbox.setImage(UIImage(named: "checked_box"), for: .normal)
        } else {
            btnCheckbox.setImage(UIImage(named: "check_box"), for: .normal)
        }
        
    }
}

extension LoginController : LoginPresenterOutput {
    func updateView() {
        // end loading
//        dismissLoading()
        
        // router to main
        let routerManager = RouterManager.shared
        let routeWelcome = WelcomeRoute()
        
        routerManager.handleRouter(routeWelcome)
    }
    
    func presentError(_ error: Error) {
        // end loading
//        dismissLoading()
        
        // show error
        showErrorAlert(message: error.localizedDescription)
    }
}

extension LoginController: XibInitalization {
    typealias Element = LoginController
}
