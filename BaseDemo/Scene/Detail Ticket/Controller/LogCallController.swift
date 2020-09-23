//
//  LogCallController.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class LogCallController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        vTitle.lblTitle.text = "Log Call"
        let v = LogCallView.xibInstance()
        vContent.addSubview(v)
        v.frame = vContent.bounds
        v.controller = self
    }
}

extension LogCallController: XibInitalization {
    typealias Element = LogCallController
}
