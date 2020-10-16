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
    @IBOutlet weak var vContent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = Color.BackgroundListColor()
        
        let loginObj = RealmManager.shared.onGetLoginObject() as? LoginObject
        
        lblName.text = loginObj?.name
        iv.layer.cornerRadius = iv.frame.size.height/2
        
    }
    
    override func layoutSubviews() {
        if let imgData = ApplicationManager.sharedInstance.getValueUserDefault(key: kAvatarImage) as? Data {
            iv.image = UIImage(data: imgData)
        }
        
        vContent.dropShadow(color: Color.BackgroundListColor())
        self.setNeedsLayout()
    }
    
}

extension ProfileCollectionReusableView : XibInitalization {
    typealias Element = ProfileCollectionReusableView
}
