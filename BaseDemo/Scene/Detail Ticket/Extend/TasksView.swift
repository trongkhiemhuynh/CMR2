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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    private func setupView() {
        let presenter = getPresenterView(title: "Tasks", isAddNew: true)
        let vMagic = MagicCollectionView.xibInstance()
        self.addSubview(presenter)
        presenter.vContent.addSubview(vMagic)
        presenter.delegate = self
        presenter.controller = controller
        
        vMagic.frame = presenter.vContent.bounds
        vMagic.dictData = ["0":["Task1","Task2","Task3","Task4","Task5","Task6"]]
        vMagic.viewType = .extend
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
    func onAddNew() {
        delegateAddSubView?.didAddNew(type: "tasks")
    }
}
