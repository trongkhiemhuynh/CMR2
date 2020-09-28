//
//  GuideCollectionViewCell.swift
//  BaseDemo
//
//  Created by khiemht on 9/27/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class GuideCollectionViewCell: UICollectionViewCell {
    
    lazy var lbl: UILabel = {
       let lbl = UILabel()
        lbl.numberOfLines = 0
//        lbl.contentMode = .center
//        lbl.center = self.center
//        lbl.frame.size = CGSize(width: widthScreen, height: heightScreen)
//        lbl.frame.origin = CGPoint(x: 20, y: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        
        
//        let leadConstraint = NSLayoutConstraint(item: lbl, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
//        let trailConstraint = NSLayoutConstraint(item: lbl, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
//        let topConstraint = NSLayoutConstraint(item: lbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
//        let bottomConstraint = NSLayoutConstraint(item: lbl, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
//
//        self.addConstraints([leadConstraint, trailConstraint, topConstraint, bottomConstraint])
//
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(lbl)
        lbl.addConstraint(top: 0, leading: 0, bottom: 0, trailing: 0, superView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func onUpdate(_ title: String) {
        lbl.text = title
    }
}
