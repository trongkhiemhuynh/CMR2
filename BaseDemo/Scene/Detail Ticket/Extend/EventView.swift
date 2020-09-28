//
//  EventView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class EventView: BaseView {

    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }

    private func setupView() {
        let vMagic = MagicCollectionView.xibInstance()
        let presenter = getPresenterView(title: "Events", isAddNew: true)
        self.addSubview(presenter)
        presenter.vContent.addSubview(vMagic)
        
        vMagic.frame = presenter.vContent.bounds
        vMagic.dictData = ["0":["Events","Events","Events","Events","Events","Events"]]
        vMagic.viewType = .extend
        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        vMagic.heightCell = heightTabbar
        vMagic.heightHeader = heightHeaderDefault
        
//        presenter.delegate = controller
    }
}
