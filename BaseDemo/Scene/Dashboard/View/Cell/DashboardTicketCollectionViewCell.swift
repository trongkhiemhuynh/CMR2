//
//  DashboardTicketCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 10/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class DashboardTicketCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 12.0
        self.clipsToBounds = true
        Logger.info(self.bounds)
    }

}

extension DashboardTicketCollectionViewCell: XibInitalization {
    typealias Element = DashboardTicketCollectionViewCell
}
