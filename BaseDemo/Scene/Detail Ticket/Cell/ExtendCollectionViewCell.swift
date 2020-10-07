//
//  ExtendCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 8/25/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ExtendCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgEx: UIImageView!
    @IBOutlet weak var lblEx: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
    }
    
    func onUpdate(text: String?) {
        guard let t = text else {return}
        
        self.lblEx.text = t
        
        let imageName = t.lowercased().replacingOccurrences(of: " ", with: "_")
        
        self.imgEx.image = UIImage(named: imageName)
    }
}

extension ExtendCollectionViewCell : XibInitalization {
    typealias Element = ExtendCollectionViewCell
}
