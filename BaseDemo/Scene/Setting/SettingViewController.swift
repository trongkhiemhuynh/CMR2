//
//  SettingViewController.swift
//  BaseDemo
//
//  Created by khiemht on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import RealmSwift

class SettingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initData() {
        let realm = try! Realm()
        let element = realm.objects(LoginObject.self)
        
        Logger.debug(element)
    }
    
    override func setupView() {
        
        let present = PresenterView.xibInstance()
        let v = MagicCollectionView.xibInstance()
        
        view.addSubview(present)
        present.frame = view.bounds
        present.vTitle.lblTitle.text = "Settings"
        present.vContent.addSubview(v)
        present.hideAddNewBtn(on: true)
        present.hideBackBtn(on: true)
        v.frame = present.vContent.bounds
        
        v.controller = self
        v.dictData = ["0":["Cached"],"1":["Push Notification", "Version: \(versionApp)"]/*,"OCR"],"2":["Log out"]*/]
        v.heightCell = 70.0
        v.heightHeader = 10.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

}
