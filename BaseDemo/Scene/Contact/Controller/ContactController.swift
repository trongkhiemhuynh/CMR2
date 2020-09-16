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
        isHiddenNavigationBar = false
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupView() {
        title = "Contact"
        let subView = MagicCollectionView.xibInstance()
        subView.dictData = ["0":["four","five","six"]]
        subView.controller = self
        view.addSubview(subView)
        subView.frame = view.bounds
        
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

extension ContactController: XibInitalization {
    typealias Element = ContactController
}
