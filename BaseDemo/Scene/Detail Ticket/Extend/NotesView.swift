//
//  NotesView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class NotesView: BaseView {
    @IBOutlet var vBound : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        print("NotesView",#line)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    private func setupView() {
        let presenter = getPresenterView(title: "Notes",isAddNew: true)

        let vMagic = MagicCollectionView.xibInstance()
        vMagic.frame = presenter.vContent.bounds
        vMagic.dictData = ["0":["Note","Note1","Note2","Note3","Note4","Note5"]]
        vMagic.magicDatasource.type = .notes
        vMagic.controller = controller
        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        
        presenter.vContent.addSubview(vMagic)
        presenter.delegate = self
        presenter.controller = controller
        
        vBound.addSubview(presenter)
    }
}

extension NotesView: XibInitalization {
    typealias Element = NotesView
}

extension NotesView: PresenterViewOutput {
    func onAddNew() {
        delegateAddSubView?.didAddNew()
    }
}
