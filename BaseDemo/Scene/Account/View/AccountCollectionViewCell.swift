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
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var ivDropdown: UIImageView!
    @IBOutlet weak var iv: UIImageView!
    
    weak var delegate: TicketDetailInputInfoCollectionViewCellOutput?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tf.isUserInteractionEnabled = false
    }

    func onUpdate(_ name: String?,_ postFix: String?,_ dictVal: Dictionary<String, String>?, isHiddenIv: Bool = true, isDropDown: Bool = true) {
        lblTitle.text = name
        tf.text = ""
        
        guard let n = name, let p = postFix else {return}
        let nameImage = p + n.lowercased().replacingOccurrences(of: " ", with: "_")
        iv.image = UIImage(named: nameImage)
        iv.isHidden = isHiddenIv
        ivDropdown.isHidden = isDropDown
        tf.isUserInteractionEnabled = isDropDown
        
        guard let dictV = dictVal else {return}
        
        for key in dictV.keys {
            if key.lowercased().contains(n.lowercased()) {
                tf.text = dictV[key]
            }
        }
    }
}

extension AccountCollectionViewCell: XibInitalization {
    typealias Element = AccountCollectionViewCell
}

extension AccountCollectionViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        delegate?.didEndEdit(titleField: lblTitle.text!, inputField: tf.text!)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        //check is show dropdown icon
        if !textField.isUserInteractionEnabled {
            delegate?.onFrameCell(self)
        }
    }
}
