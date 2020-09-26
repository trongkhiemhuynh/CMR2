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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    private func setupView() {
        let vMagic = MagicCollectionView.xibInstance()
        let presenter = getPresenterView(title: "Articles", isAddNew: false)
        self.addSubview(presenter)
        presenter.vContent.addSubview(vMagic)

        vMagic.frame = CGRect(x: 0, y: paddingTop, width: widthScreen, height: heightScreen - heightHeaderProfile)
        vMagic.dictData = ["0":["Articles1","Articles2","Articles3","Articles4","Articles5","Articles6"]]
        vMagic.magicDatasource.type = .extend
        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
    }

}
