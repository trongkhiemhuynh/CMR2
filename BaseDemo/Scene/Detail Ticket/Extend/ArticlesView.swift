//
//  ArticlesView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ArticlesView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        let vMagic = MagicCollectionView.xibInstance()
        let presenter = getPresenterView(title: "Chat", isAddNew: false)
        self.addSubview(presenter)
        presenter.vContent.addSubview(vMagic)

        vMagic.frame = CGRect(x: 0, y: paddingTop, width: presenter.vContent.bounds.width, height: presenter.vContent.bounds.height)
        vMagic.dictData = ["0":["Messenger","Whatsapp","Line","Zalo","Snap Chat","Instagram"]]
        vMagic.viewType = .extend
        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        vMagic.heightHeader = heightHeaderDefault
        vMagic.heightCell = heightDefaultCell
    }

}
