//
//  ContactDetailController.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ContactDetailController: BaseViewController {

    override func viewDidLoad() {
        isHiddenNavigationBar = false
        super.viewDidLoad()
        title = "Contact Detail"
        // Do any additional setup after loading the view.
    }

    override func setupView() {
        let magicView = MagicCollectionView.xibInstance()
        view.addSubview(magicView)
        magicView.controller = self

        magicView.dictData = ["0":["First Name","Last Name","Full Name","Account Name","Office Phone","Mobile Phone","Email","Title","Department","Description"]]
        magicView.frame = view.bounds
    }

}

extension ContactDetailController: XibInitalization {
    typealias Element = ContactDetailController
}
