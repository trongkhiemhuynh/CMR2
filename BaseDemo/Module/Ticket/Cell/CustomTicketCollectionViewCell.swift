//
//  CustomTicketCollectionViewCell.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

struct TicketListModel {
    var name : String
    var id : String
    var status : String
}

class CustomTicketCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblStatus : UILabel!
    @IBOutlet weak var lblID : UILabel!
    @IBOutlet weak var vPopup : UIView!
    @IBOutlet weak var vBound : UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        vBound.layer.cornerRadius = 8.0
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(closePopUp(gesture: )))
        
//        vBound.addGestureRecognizer(tap)
        layer.cornerRadius = 8.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.clear.cgColor
        layer.masksToBounds = true

        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
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
    
    func updateData(_ data : TicketListModel) {
        lblName.text = data.name
        lblID.text = data.id
        lblStatus.text = data.status
    }
}

extension CustomTicketCollectionViewCell : XibInitalization {
    typealias Element = CustomTicketCollectionViewCell
}
