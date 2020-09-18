//
//  FilterCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 9/10/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iv : UIImageView!
    @IBOutlet weak var tf : SkyFloatingLabelTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        iv.image = UIImage(named: "calendar")
        iv.isHidden = true
    }

}

extension FilterCollectionViewCell: XibInitalization {
    typealias Element = FilterCollectionViewCell
}
