//
//  GuideCollectionViewCell.swift
//  BaseDemo
//
//  Created by khiemht on 9/27/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class GuideCollectionViewCell: UICollectionViewCell {
    
    lazy var iv: UIImageView = {
       let imv = UIImageView()
        imv.contentMode = .scaleAspectFill
//        imv.translatesAutoresizingMaskIntoConstraints = false

        return imv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(iv)
        iv.frame = self.bounds
//        iv.addConstraint(top: 0, leading: 0, bottom: 0, trailing: 0, superView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        iv.image = nil
    }
    
    func onUpdate(_ title: String) {
        iv.image = UIImage(named: title)
    }
}
