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
import RealmSwift

protocol LoginControllerOutput {
    func fetchAuthentication(username: String, password: String)
}

class LoginController : BaseViewController {

    @IBOutlet weak var tfUserName: SkyFloatingLabelTextField!
    
    @IBOutlet weak var tfPassword: SkyFloatingLabelTextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnCheckbox: UIButton!
    
    ///  MARK: - Output
    var output: LoginControllerOutput?
    
    var isCheck: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    override func setupView() {
        tfUserName.placeholder = "Username"
        tfUserName.title = "Username"
        tfUserName.delegate = self
        tfPassword.placeholder = "Password"
        tfPassword.title = "Password"
        tfPassword.isSecureTextEntry = true
        tfPassword.delegate = self
        
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
//        #if RELEASE
            onTransition()
//        #else
//            let isVerified = verifyLogin(username: tfUserName.text, password: tfPassword.text)
//            //fetch
//            onLogin(isVerified)
//        #endif
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
    func pushView() {
        onDismissLoading()
        onTransition()
    }
    
    private func onTransition() {
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            let vc = GuideController(collectionViewLayout: flowLayout)
            if let w = UIApplication.shared.delegate?.window {
                w?.rootViewController = vc
            }
//            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func presentError(_ error: Error) {
        //end loading
        onDismissLoading()
        
        // show error
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
            self.showAlert(title: AlertType.error.rawValue, message: error.localizedDescription)
        }
        
        //FIXME save to realm
//        let realm = try! Realm()
//        try! realm.write {
//            let login = realm.create(LoginObject.self)
//            login.name = "steve"
//            login.token = "jslfjsalfjlkasdjfdsfhowejktrnwe93r434h3kjh53jh2k53j2k5hk"
//            login.tenant = "basebs.com"
//            //log
//            Logger.info(login)
//            realm.add(login)
//        }
    }
}

extension LoginController: XibInitalization {
    typealias Element = LoginController
}

extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //check username+password
        let isVerified = verifyLogin(username: tfUserName.text, password: tfPassword.text)
        onLogin(isVerified)
        
        return true
    }
    
    
}

extension LoginController {
    private func verifyLogin(username: String?, password: String?) -> Bool {
            guard let user = username, let pass = password else {
                return false
            }
            
            if user.isEmpty || pass.isEmpty || !user.isValidEmail() {
                return false
            }
            
            return true
        }
        
        private func onLogin(_ isVerified: Bool) {
            if isVerified {
                //FIXME
                onLoading()
    //            output?.fetchAuthentication(username: , password: )
//                Networking.shared.fetchLogin(userName: tfUserName.text!, password: tfPassword.text!,
                    
//                Networking.shared.delegate = self
                Networking.shared.fetchLogin(userName: tfUserName.text!, password: tfPassword.text!) { (arrData, err) in
                    if err != nil {
                        self.presentError(err!)
                    } else {
                        self.pushView()
                    }
                }
            } else {
                // show error
                showAlert(title: AlertType.error.rawValue, message: NSError.invalidUsernameOrPassword().localizedDescription)
            }
        }
}
