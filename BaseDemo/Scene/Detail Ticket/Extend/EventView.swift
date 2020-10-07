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
        presenter.delegate = self
        vMagic.frame = presenter.vContent.bounds
        vMagic.dictData = ["0":["WWDC 2020","Google I/O"]]
        vMagic.viewType = .extend_event
        vMagic.collectionView.registerCell(ExtendedCollectionViewCell.self)
        vMagic.heightCell = heightMediumCell
        vMagic.heightHeader = heightHeaderDefault
    }
}

extension EventView: PresenterViewOutput {
    func onAddNew() {
        delegateAddSubView?.didAddNew(type: Extend_Type.event.rawValue)
    }
    
    func onComplete() {
        
    }
    
    
}
