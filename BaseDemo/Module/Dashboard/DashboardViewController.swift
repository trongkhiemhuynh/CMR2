//
//  DashboardViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func setupView() {
        self.view.backgroundColor = BASEColor.BackgroundListColor()
        
//        let label = UILabel(frame: CGRect.zero)
//        label.text = "[CONTROLLER_NAME] View Controller"
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.clipsToBounds = true
//        label.sizeToFit()
//        self.view.addSubview(label)
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//        ])
        let modeLeo = Bundle.main.loadNibNamed("CustomDashboard", owner: self, options: nil)?.last as? UIView
        modeLeo?.frame = CGRect(x: 0, y: 0, width: widthScreen, height: heightScreen)       
        self.view.addSubview(modeLeo!)
        self.view.layoutIfNeeded()
    }
    
    
    
    @IBAction func actionClick() {
//        let height = CGFloat(300)
//
//        popupView = Bundle.main.loadNibNamed("PopupView", owner: self, options: nil)?.first as! PopupView
//
//        popupView.frame = CGRect(x: 0, y: heightScreen - height, width: widthScreen, height: height)
//        view.addSubview(popupView)
//
//        UIView.animate(withDuration: 0.35, delay: 0, options: .transitionFlipFromBottom, animations: {
//            self.view.layoutIfNeeded()
//        }) { (success) in
//            print(success)
//        }
    }
    
    @IBAction func actionDismiss() {
//        popupView.removeFromSuperview()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
