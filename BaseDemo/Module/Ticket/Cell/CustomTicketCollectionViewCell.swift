//
//  CustomTicketCollectionViewCell.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomTicketCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblStatus : UILabel!
    @IBOutlet weak var lblID : UILabel!
    @IBOutlet weak var vPopup : UIView!
    @IBOutlet weak var vBound : UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vBound.layer.cornerRadius = 8.0
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(closePopUp(gesture: )))
        
//        vBound.addGestureRecognizer(tap)
    }
    
    @objc func closePopUp(gesture : UITapGestureRecognizer) {
        self.vPopup.isHidden = !self.vPopup.isHidden
        
        UIView.animate(withDuration: 0.35) {
            self.layoutIfNeeded()
        }
    }

    @IBAction func actionMoreCell() {
        
        self.vPopup.isHidden = !self.vPopup.isHidden
        
        UIView.animate(withDuration: 0.35) {
            self.layoutIfNeeded()
        }
        
    }
}

extension CustomTicketCollectionViewCell : XibInitalization {
    typealias Element = CustomTicketCollectionViewCell
}
