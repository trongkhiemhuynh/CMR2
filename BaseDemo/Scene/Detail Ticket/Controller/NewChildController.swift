//
//  NewChildController.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class NewChildController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupView() {
        super.setupView()
        
        let present = PresenterView.xibInstance()
        present.frame = view.bounds
        view.addSubview(present)
    }

}

extension NewChildController: XibInitalization {
    typealias Element = NewChildController
}
