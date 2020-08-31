//
//  NewTicketCheckboxCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 8/28/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class NewTicketCheckboxCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var btnCheckbox : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func actionCheck() {
        btnCheckbox.setImage(UIImage(named: "checked_box"), for: .normal)
    }

}

extension NewTicketCheckboxCollectionViewCell : XibInitalization {
    typealias Element = NewTicketCheckboxCollectionViewCell
    
    
}
