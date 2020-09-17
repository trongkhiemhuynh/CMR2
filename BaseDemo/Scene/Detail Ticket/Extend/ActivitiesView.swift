//
//  ActivitiesView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ActivitiesView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let vMagic = MagicCollectionView.xibInstance()
        vMagic.frame = self.bounds
        vMagic.dictData = ["0":["Task","Task","Task","Task","Task","Task"]]
        vMagic.magicDatasource.type = .extend
        vMagic.controller = UIViewController()
        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        self.addSubview(vMagic)
    }

}
