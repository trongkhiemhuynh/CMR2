//
//  ChangeOwnerController.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ChangeOwnerController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        super.setupView()
        let present = PresenterView.xibInstance()
        present.vTitle.lblTitle.text = "Change owner"
        present.frame = view.bounds
        view.addSubview(present)
        
        let changeOwner = ChangeOwnerView.xibInstance()
        present.vContent.addSubview(changeOwner)
        changeOwner.frame = present.vContent.bounds
        present.delegate = self
        present.onChangeAction(type: .save)
    }

}

extension ChangeOwnerController: XibInitalization {
    typealias Element = ChangeOwnerController
}
