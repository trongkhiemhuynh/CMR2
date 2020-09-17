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
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblTime : UILabel!
    @IBOutlet weak var lblDescription : UILabel!
    @IBOutlet weak var iv : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        vContent.layer.cornerRadius = 8
    }

}

extension TicketDetailActivityCollectionViewCell : XibInitalization {
    typealias Element = TicketDetailActivityCollectionViewCell
}
