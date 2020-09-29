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
        vMagic.dictData = ["0":["WWDC 2020","Google I/0","Amazon Prime 2020"]]
        vMagic.viewType = .extend
        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        vMagic.heightCell = heightDefaultCell
        vMagic.heightHeader = heightHeaderDefault
    }
}
