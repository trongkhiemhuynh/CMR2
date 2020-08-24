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

//        let nvActivity = NVActivityIndicatorView(frame: CGRect(origin: CGPoint(x: (view.frame.width - 50)/2, y: (view.frame.height - 50)/2), size: CGSize(width: 50, height: 50)), type: .circleStrokeSpin, color: .red, padding: 0)
        
//        view.addSubview(nvActivity)
        
//        nvActivity.startAnimating()
        
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

}

