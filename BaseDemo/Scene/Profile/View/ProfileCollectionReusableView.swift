//
//  ProfileCollectionReusableView.swift
//  BaseDemo
//
//  Created by macOS on 9/11/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ProfileCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var iv: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = BASEColor.BackgroundListColor()
        lblName.text = nameDevice
        
    }
    
    override func layoutSubviews() {
        if let imgData = ApplicationManager.sharedInstance.getValueUserDefault(key: kAvatarImage) as? Data {
            iv.image = UIImage(data: imgData)
        }
    }
    
}

extension ProfileCollectionReusableView : XibInitalization {
    typealias Element = ProfileCollectionReusableView
}
