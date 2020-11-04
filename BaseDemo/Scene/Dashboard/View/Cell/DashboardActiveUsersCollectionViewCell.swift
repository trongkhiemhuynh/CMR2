//
//  DashboardActiveUsersCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 11/4/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class DashboardActiveUsersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iv1: UIImageView!
    @IBOutlet weak var iv2: UIImageView!
    @IBOutlet weak var iv3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = corner12Radius
        self.clipsToBounds = true
        
        iv1.layer.cornerRadius = iv1.bounds.height/2
        iv2.layer.cornerRadius = iv1.bounds.height/2
        iv3.layer.cornerRadius = iv1.bounds.height/2
    }

}

extension DashboardActiveUsersCollectionViewCell: XibInitalization {
    typealias Element = DashboardActiveUsersCollectionViewCell
}
