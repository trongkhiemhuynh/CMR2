//
//  AccountReusableView.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class AccountReusableView: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = BASEColor.BackgroundListColor()
    }
    
}

extension AccountReusableView: XibInitalization {
    typealias Element = AccountReusableView
}
