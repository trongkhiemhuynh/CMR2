//
//  MagicHeaderCollectionReusableView.swift
//  BaseDemo
//
//  Created by macOS on 9/10/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class MagicHeaderCollectionReusableView: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

extension MagicHeaderCollectionReusableView : XibInitalization {
    typealias Element = MagicHeaderCollectionReusableView
}
