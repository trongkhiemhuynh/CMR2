//
//  ProfileCollectionReusableView.swift
//  BaseDemo
//
//  Created by macOS on 9/11/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ProfileCollectionReusableView: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

extension ProfileCollectionReusableView : XibInitalization {
    typealias Element = ProfileCollectionReusableView
}
