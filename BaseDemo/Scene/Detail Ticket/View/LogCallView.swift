//
//  LogCallView.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class LogCallView: BaseView {
    
    @IBOutlet weak var vSlide: CustomTicketStageView!
    
    lazy var child: UIViewController = {
       return UIViewController()
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vSlide.arrStage = ["All contacts","Favorite","Group"]
        vSlide.itemsPerRow = 3
        
//        let v = MagicCollectionView.xibInstance()
//        vContent.addSubview(v)
//        v.frame = vContent.bounds
//        v.dictData = ["0":["log","log1","log2"]]
//        v.controller = UIViewController()
//        v.heightCell = 70
//        v.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
//        v.magicDatasource.type = .notes

    }
    
    override func layoutSubviews() {
        //add child controller
        let v = MagicCollectionView.xibInstance()
        let presenter = getPresenterView(title: "", isAddNew: false)
        
        presenter.vContent.addSubview(v)
        presenter.frame = vContent.bounds
        
        child.view.addSubview(presenter)
        
        controller?.addChild(child)
        controller?.add(child, contentView: vContent)
        
        v.dictData = ["0":["Bill Sr","Bill Jr"]]
        v.controller = controller
        v.heightCell = 70
        v.heightHeader = 10
        v.viewType = .logcall
        
        v.collectionView.registerCell(LogCallViewCell.self)
    }
}

extension LogCallView: XibInitalization {
    typealias Element = LogCallView
}
