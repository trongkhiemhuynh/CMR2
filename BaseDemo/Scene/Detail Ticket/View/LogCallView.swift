//
//  LogCallView.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class LogCallView: BaseView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let v = MagicCollectionView.xibInstance()
        vContent.addSubview(v)
        v.frame = vContent.bounds
        v.dictData = ["0":["log","log1","log2"]]
        v.controller = UIViewController()
        v.heightCell = 70
        v.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        v.magicDatasource.type = .notes
    }
}

extension LogCallView: XibInitalization {
    typealias Element = LogCallView
}
