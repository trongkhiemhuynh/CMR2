//
//  AccountCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 9/16/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class AccountCollectionViewCell: UICollectionViewCell {
    
    //outlet
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var ivDropdown : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension AccountCollectionViewCell : XibInitalization {
    typealias Element = AccountCollectionViewCell
}
