//
//  PreviewWelcomeViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/7/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var vLarge: UIView!
    @IBOutlet weak var ivUser: UIImageView!
    @IBOutlet weak var constraintCenterYIvUser: NSLayoutConstraint!
    @IBOutlet weak var ivAgree: UIImageView!
    @IBOutlet weak var vCircle: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    //private variable
    private let constantRatioY: CGFloat = -0.25

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupView()
    }
    
    func setupView(){
        ivAgree.isHidden = true
        
        let color = Color.MainAppColor()
        
        vCircle.backgroundColor = color
        vCircle.layer.cornerRadius = vCircle.bounds.width/2
        
        vLarge.backgroundColor = .clear
        vLarge.layer.borderWidth = 18.0
        vLarge.layer.borderColor = UIColor(red: 217/255, green: 243/255, blue: 241/255, alpha: 1.0).cgColor // 217 243 241
        vLarge.layer.cornerRadius = vLarge.bounds.width/2
        
        ivUser.layer.cornerRadius = ivUser.bounds.height/2
        ivAgree.layer.cornerRadius = ivAgree.bounds.height/2
        
        let loginObj = RealmManager.shared.onGetLoginObject() as? LoginObject
        
        lblName.text = loginObj?.name
        
        lblJob.text = loginObj?.tenant
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        pushToMainApp()
    }
    
    private func pushToMainApp() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let constantMove = self.constantRatioY * self.vCircle.frame.height

            UIView.animate(withDuration: 0.35, animations: {
                self.constraintCenterYIvUser.constant = constantMove
                self.view.layoutIfNeeded()
            }, completion: { (success) in
                
                self.ivAgree.isHidden = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35, execute: {
                    RouterManager.shared.handleRouter(MainRoute())
                })
                
            })
//        }
    }

    deinit {
        Logger.debug("deinit")
    }

}

extension WelcomeViewController : XibInitalization {
    typealias Element = WelcomeViewController
}
