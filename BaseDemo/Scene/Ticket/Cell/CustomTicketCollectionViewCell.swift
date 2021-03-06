//
//  CustomTicketCollectionViewCell.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

struct TicketListModel {
    var name: String?
    var id: String
    var status: String?
}

class CustomTicketCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblStatus : UILabel!
    @IBOutlet weak var lblID : UILabel!

    @IBOutlet weak var vBound : UIView!
    @IBOutlet weak var ivLineStatus: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        vBound.layer.cornerRadius = 8.0
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(closePopUp(gesture: )))
        
//        vBound.addGestureRecognizer(tap)
//        layer.cornerRadius = 12.0
//        layer.borderWidth = 4.0
//        layer.borderColor = UIColor.clear.cgColor
//        layer.masksToBounds = true
//
//        layer.backgroundColor = UIColor.white.cgColor
//        layer.shadowColor = BASEColor.CellShadowColor().cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
//        layer.shadowRadius = 1.0
//        layer.shadowOpacity = 1.0
//
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        
        //swipe gesture recognizer
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(onDelete(swipeToDeleteGesture:)))
        swipe.direction = .left
        self.addGestureRecognizer(swipe)
    }
    
    @objc func onDelete(swipeToDeleteGesture: UISwipeGestureRecognizer) {
        if swipeToDeleteGesture.state == .ended {
            print("ended")
        }
        
        if swipeToDeleteGesture.state == .began {
            print("began")
        }
    }
    
    @objc func closePopUp(gesture : UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.35) {
            self.layoutIfNeeded()
        }
    }

    @IBAction func actionMoreCell() {
        
        UIView.animate(withDuration: 0.35) {
            self.layoutIfNeeded()
        }
        
    }
    
    func updateData(_ data : TicketListModel) {
        lblName.text = data.name
        lblID.text = data.id
        lblStatus.text = data.status
        
        var statusLine: String = "red_rectangle"
        
        guard let status = data.status else {return}
        
        if status == "Processing" {
            statusLine = "brown_rectangle"
        } else if status == "Escalated" {
            statusLine = "red_rectangle"
        } else if status == "Pending" {
            statusLine = "green_rectangle"
        }
        
        ivLineStatus.image = UIImage(named: statusLine)
        self.dropShadow(color: .darkGray)
    }
}

extension CustomTicketCollectionViewCell : XibInitalization {
    typealias Element = CustomTicketCollectionViewCell
}
