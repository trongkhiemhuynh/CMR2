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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vBound.layer.cornerRadius = 12
        vBound.clipsToBounds = true
    }

}

extension MagicCollectionViewCell : XibInitalization {
    typealias Element = MagicCollectionViewCell
}
