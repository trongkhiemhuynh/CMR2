//
//  ViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/5/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

//import NVActivityIndicatorView
import SkyFloatingLabelTextField

class LoginViewController : BaseViewController {

    @IBOutlet weak var tfUserName: SkyFloatingLabelTextField!
    
    @IBOutlet weak var tfPassword: SkyFloatingLabelTextField!
    
    @IBOutlet weak var btnLogin : UIButton!
    
    @IBOutlet weak var btnCheckbox : UIButton!
    
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
    }
    
    @objc func tapDismiss(gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @IBAction func loginAction(_ sender : AnyObject) {
        
        addAlertLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            nvActivity.stopAnimating()
            self.dismissAlertLoading()
           
            let vc = PreviewWelcomeViewController()
            
            self.present(vc, animated: false, completion: {
                print("completed")
            })
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

