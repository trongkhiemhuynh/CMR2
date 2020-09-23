//
//  PostView.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class PostView: BaseView {
    @IBOutlet weak var vShared: UIView!
    @IBOutlet weak var lblRole: UILabel!
    
    override class func awakeFromNib() {
        
    }
    
    override func layoutSubviews() {
        vShared.layer.borderWidth = 1
        vShared.layer.borderColor = UIColor.lightGray.cgColor
        vShared.layer.cornerRadius = 8
    }
    
    @IBAction func onAttach() {
        let bottomView = PopupView.xibInstance()
        self.addSubview(bottomView)
        bottomView.frame = self.bounds
        bottomView.arrItems = ["Attach File","Attach Image","Add Tag"]
        bottomView.isLeftIc = true
        
        UIView.animate(withDuration: 0.35) {
            self.setNeedsLayout()
        }
    }
}

extension PostView: XibInitalization {
    typealias Element = PostView
}
