//
//  MagicCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 9/10/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class BaseMagicCollectionViewCell : UICollectionViewCell {
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var icRight : UIImageView!
    @IBOutlet weak var vImg : UIView!
    @IBOutlet weak var vBound : UIView!
}

class MagicCollectionViewCell: BaseMagicCollectionViewCell {
    
    @IBOutlet weak var sw: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        vBound.layer.cornerRadius = 8
//        vBound.clipsToBounds = true
//        vBound.dropShadow(color: .lightGray)
        isHideSwitch(true)
    }
    
    func isHideSwitch(_ hide: Bool) {
        sw.isHidden = hide
    }
    
    func onUpdate(title: String) {
        self.img.image = UIImage(named: "no_avatar")
        self.vImg.isHidden = true
        self.title.text = title
        
        if title.contains("Push") {
            isHideSwitch(false)
        }
    }
    
    override func prepareForReuse() {
        isHideSwitch(true)
    }

}

extension MagicCollectionViewCell : XibInitalization {
    typealias Element = MagicCollectionViewCell
}
