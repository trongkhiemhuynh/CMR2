//
//  CustomTicketStageCollectionViewCell.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomTicketStageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblStage : UILabel!
    @IBOutlet weak var imgStage : UIImageView!
    
    //private varible
    var isChoosen: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        isChoosen = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        Logger.info(self.frame)
    }
    
    func didUpdate(_ isSelected : Bool) {
        if isSelected {
            imgStage.backgroundColor = Color.MainAppColor()
            lblStage.font = UIFont.boldSystemFont(ofSize: 18.0)
            lblStage.textColor = Color.MainAppColor()
        } else {
            // previously selection
            imgStage.backgroundColor = .white
            lblStage.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
            lblStage.textColor = Color.TextTitleColor
        }
        
//        layoutIfNeeded()
    }

}

extension CustomTicketStageCollectionViewCell : XibInitalization {
    typealias Element = CustomTicketStageCollectionViewCell
}
