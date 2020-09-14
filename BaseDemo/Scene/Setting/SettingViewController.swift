//
//  SettingViewController.swift
//  BaseDemo
//
//  Created by khiemht on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupView() {
        let v = MagicCollectionView.xibInstance()
        v.controller = self
        v.dictData = ["0":["Language"],"1":["Change Dashboard","Change Branding","Notification"],"2":["Version"]]
        view.addSubview(v)
        v.frame = view.frame
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        navigationController?.navigationBar.isHidden = false
        self.title = "Settings"
    }

}
