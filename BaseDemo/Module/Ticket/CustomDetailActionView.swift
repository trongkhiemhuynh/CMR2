//
//  CustomActionDetailView.swift
//  BaseDemo
//
//  Created by khiemht on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomDetailActionView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func commonInit() {
        Bundle.main.loadNibNamed("CustomDetailActionView", owner: self, options: nil)
        addSubview(vContent)
        vContent.frame = self.bounds
    }
}
