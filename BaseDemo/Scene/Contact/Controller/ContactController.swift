//
//  ContactController.swift
//  BaseDemo
//
//  Created by macOS on 9/16/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ContactController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        let present = PresenterView.xibInstance()
        present.frame = view.bounds
        present.vTitle.lblTitle.text = "Contact list"
        present.controller = self
        view.addSubview(present)
        
        let subView = MagicCollectionView.xibInstance()
        subView.dictData = ["0":["Apple"],"1":["Amazon"],"2":["Netflix"],"3":["Google"],"4":["Facebook"]]
        subView.controller = self
        //account cell
        subView.heightHeader = heightHeaderDefault
        subView.heightCell = heightLargeCell
        subView.viewType = .contact
        subView.collectionView.registerCell(LogCallViewCell.self)
//        subView.delegateAddSubView = self
        present.vContent.addSubview(subView)
        subView.frame = present.vContent.bounds
    }

}

extension ContactController: XibInitalization {
    typealias Element = ContactController
}
