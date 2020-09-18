//
//  CustomerJourneyCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 9/18/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomerJourneyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var line: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblTime.layer.cornerRadius = 16
        lblTime.clipsToBounds = true
    }

}

extension CustomerJourneyCollectionViewCell: XibInitalization {
    typealias Element = CustomerJourneyCollectionViewCell
}
