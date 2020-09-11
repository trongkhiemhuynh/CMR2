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
}

class MagicCollectionViewCell: BaseMagicCollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

}

extension MagicCollectionViewCell : XibInitalization {
    typealias Element = MagicCollectionViewCell
}
