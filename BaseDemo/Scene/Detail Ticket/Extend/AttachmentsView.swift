//
//  AttachmentsView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class AttachmentsView: BaseView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }

    private func setupView() {
        let vMagic = MagicCollectionView.xibInstance()
        let presenter = getPresenterView(title: "Attachments", isAddNew: false)
        self.addSubview(presenter)
        presenter.vContent.addSubview(vMagic)
        
        vMagic.frame = presenter.vContent.bounds
        vMagic.dictData = ["0":["Word","Excel","Power point","Key note","Page","Number"]]
        vMagic.viewType = .extend

        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        vMagic.heightHeader = heightHeaderDefault
        vMagic.heightCell = heightDefaultCell
    }
}
