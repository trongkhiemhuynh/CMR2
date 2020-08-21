//
//  TicketDetailActivityCollectionViewCell.swift
//  BaseDemo
//
//  Created by BASEBS on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TicketDetailActivityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var vContent : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        vContent.layer.cornerRadius = 8
    }

}
