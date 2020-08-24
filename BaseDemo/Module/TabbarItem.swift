//
//  TabbarItem.swift
//  BaseDemo
//
//  Created by khiemht on 8/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TabbarItem: UIView {

    @IBOutlet weak var lblItem : UILabel!
    @IBOutlet weak var imgItem : UIImageView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override class func awakeFromNib() {
        super.awakeFromNib()

    }
    
    @objc func handleTapItem(gesture: UITapGestureRecognizer) {
        print(#function)
    }

}
