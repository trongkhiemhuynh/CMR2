//
//  ChangeOwnerView.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ChangeOwnerView: BaseView {
    /// outlet
    @IBOutlet weak var vSearchOwner: UIView!
    @IBOutlet weak var heightSearchOwner: NSLayoutConstraint!
    @IBOutlet weak var btnSearch: UIButton!
    
    var isSelected = false
    var vMagic: MagicCollectionView!
    /// function
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = Color.BackgroundListColor()
        vSearchOwner.layer.cornerRadius = corner12Radius
//        vSearchOwner.layer.borderWidth = 1
//        vSearchOwner.layer.borderColor = UIColor.lightGray.cgColor
        vSearchOwner.clipsToBounds = true
    }
    
    override func layoutSubviews() {
//        self.layoutMargins = sectionInsetsDefault
    }
    
    @IBAction func onChangeOwner(_ sender: Any) {
        isSelected = !isSelected
        
        if isSelected {
            heightSearchOwner.constant = 200
            
            vMagic = MagicCollectionView.xibInstance()
            
            vMagic.frame = CGRect(origin: CGPoint(x: 0, y: btnSearch.frame.size.height), size: CGSize(width: btnSearch.frame.size.width, height: heightSearchOwner.constant - btnSearch.frame.size.height))
            vMagic.dictData = ["0":["Admin","Agent"]]
            vMagic.viewType = .extend_event
            vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
            vMagic.heightCell = heightDefaultCell
            vMagic.heightHeader = heightHeaderDefault
            vSearchOwner.addSubview(vMagic)
        } else {
            heightSearchOwner.constant = 60
            vMagic.removeFromSuperview()
        }
        
        UIView.animate(withDuration: 0.35, animations: {
            self.setNeedsLayout()
        }) { (_) in
            print(#function)
        }
    }
}

extension ChangeOwnerView: XibInitalization {
    typealias Element = ChangeOwnerView
}
