//
//  ExtendedCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 10/7/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ExtendedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = corner8Radius
    }

    func onUpdate(item: ExtendModel) {
        lblTitle.text = item.title
        lblDescription.text = item.description
        iv.image = UIImage(named: item.imageName!)
    }
}

extension ExtendedCollectionViewCell: XibInitalization {
    typealias Element = ExtendedCollectionViewCell
}
