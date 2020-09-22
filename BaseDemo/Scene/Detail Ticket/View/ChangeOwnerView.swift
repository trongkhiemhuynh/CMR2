//
//  ChangeOwnerView.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ChangeOwnerView: BaseView {
    /// outlet
    @IBOutlet weak var vSearchOwner: UIView!
    @IBOutlet weak var heightSearchOwner: NSLayoutConstraint!
    
    /// function
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = BASEColor.BackgroundListColor()
        vSearchOwner.layer.cornerRadius = 12
        vSearchOwner.clipsToBounds = true
    }
    @IBAction func onChangeOwner(_ sender: Any) {
        heightSearchOwner.constant = 100
        
        UIView.animate(withDuration: 0.35, animations: {
            self.setNeedsLayout()
        }) { (_) in
            print(#function)
        }
    }
}

extension ChangeOwnerView: XibInitalization {
    typealias Element = ChangeOwnerView
}
