//
//  NewTicketCheckboxCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 8/28/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol NewTicketCheckboxCollectionViewCellOutput: class {
    func didEndEdit(titleField: String, inputField: Bool)
}

class NewTicketCheckboxCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var btnCheckbox : UIButton!
    // creat new image
    //variable
    weak var delegate: NewTicketCheckboxCollectionViewCellOutput?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func actionCheck() {
        btnCheckbox.isSelected = !btnCheckbox.isSelected
        
        if btnCheckbox.isSelected {
            btnCheckbox.setImage(UIImage(named: "checked_box"), for: .normal)
        } else {
            btnCheckbox.setImage(UIImage(named: "box"), for: .normal)
        }
        
        delegate?.didEndEdit(titleField: lblTitle.text!, inputField: btnCheckbox.isSelected)
    }

}

extension NewTicketCheckboxCollectionViewCell : XibInitalization {
    typealias Element = NewTicketCheckboxCollectionViewCell
}
