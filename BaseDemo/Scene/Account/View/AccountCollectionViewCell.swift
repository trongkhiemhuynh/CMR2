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
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivDropdown: UIImageView!
    @IBOutlet weak var iv: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ivDropdown.isHidden = true
    }

    func onUpdate(_ name: String?,_ postFix: String?) {
        lblTitle.text = name
        lblName.text = name
        
        if let n = name, let p = postFix {
            let nameImage = p + n.lowercased().replacingOccurrences(of: " ", with: "_")
            iv.image = UIImage(named: nameImage)
        }
    }
}

extension AccountCollectionViewCell : XibInitalization {
    typealias Element = AccountCollectionViewCell
}
