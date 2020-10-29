//
//  ReportCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 10/29/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ReportCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFolder: UILabel!
    @IBOutlet weak var lblRole: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = corner8Radius
        self.clipsToBounds = true
    }

}

extension ReportCollectionViewCell: XibInitalization {
    typealias Element = ReportCollectionViewCell
}
