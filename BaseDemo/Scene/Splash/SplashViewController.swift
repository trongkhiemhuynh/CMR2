//
//  SplashViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/5/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import RealmSwift

class SplashViewController: BaseViewController {

    @IBOutlet weak var lblSlogan : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        lblSlogan.addCharacterSpacing(kernValue: 4)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }
    
    override func initData() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            let realm = try! Realm()
            let loginObject = realm.objects(LoginObject.self).first
            
            let nameObj = loginObject?.name

            Logger.debug(nameObj)
            
            if let name = nameObj, name == "steve" {
                
                //route to main
                RouterManager.shared.handleRouter(MainRoute())
            } else {
                //route to login
                RouterManager.shared.handleRouter(LoginRoute())
            }
        }
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

extension SplashViewController : XibInitalization {
    typealias Element = SplashViewController
}
