//
//  AccountController.swift
//  BaseDemo
//
//  Created by macOS on 9/16/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class AccountController: BaseViewController {

    override func viewDidLoad() {
        isHiddenNavigationBar = false
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        title = "Account"
        let subView = MagicCollectionView.xibInstance()
        subView.dictData = ["0":["Account Name","Industry","Primary phone","Assign to","Street address","District","City","Country","Description"]]
        subView.controller = self
        subView.heightCell = 70
        view.addSubview(subView)
        subView.frame = view.bounds
        
    }

}

extension AccountController: XibInitalization {
    typealias Element = AccountController
}
