//
//  CommentsView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CommentsView: BaseView {
    
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
        let presenter = getPresenterView(title: "Comments", isAddNew: true)
        self.addSubview(presenter)
        presenter.vContent.addSubview(vMagic)
        presenter.delegate = self
        vMagic.frame = presenter.vContent.bounds
        vMagic.dictData = ["0":["Very good","Good","Bad","Very bad"]]
        vMagic.viewType = .extend_comment

        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        vMagic.heightHeader = heightHeaderDefault
        vMagic.heightCell = heightMediumCell
    }

}

extension CommentsView: PresenterViewOutput {
    func onComplete() {
        
    }
    
    func onAddNew() {
        delegateAddSubView?.didAddNew(type: Extend_Type.comments.rawValue)
    }
}
