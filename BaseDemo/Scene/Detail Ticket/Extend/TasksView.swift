//
//  TasksView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TasksView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        setupView()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let presenter = getPresenterView(title: "Tasks", isAddNew: true)
        let vMagic = MagicCollectionView.xibInstance()
        self.addSubview(presenter)
        presenter.vContent.addSubview(vMagic)
        presenter.delegate = self
        presenter.controller = controller
        
        vMagic.frame = presenter.vContent.bounds
        vMagic.dictData = ["0":["Phone call","Facebook channel","Hubspot channel"]]
        vMagic.viewType = .extend_task
        vMagic.controller = controller
        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        vMagic.heightHeader = heightHeaderDefault
        vMagic.heightCell = heightLargeCell
    }
}

extension TasksView: XibInitalization {
    typealias Element = TasksView
}

extension TasksView: PresenterViewOutput {
    func onComplete() {
        
    }
    
    func onAddNew() {
        delegateAddSubView?.didAddNew(type: Extend_Type.tasks.rawValue)
    }
}
