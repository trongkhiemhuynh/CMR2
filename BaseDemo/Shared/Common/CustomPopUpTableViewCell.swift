//
//  CustomPopUpTableViewCell.swift
//  BaseDemo
//
//  Created by macOS on 8/26/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomPopUpTableViewCell: UITableViewCell {

    @IBOutlet weak var iv : UIImageView!
    @IBOutlet weak var lbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData(img : UIImage, title : String) {
        iv.image = img
        lbl.text = title
    }
}

extension CustomPopUpTableViewCell : XibInitalization {
    typealias Element = CustomPopUpTableViewCell
}
