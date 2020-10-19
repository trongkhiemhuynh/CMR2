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
        setupView()
    }
    
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
        let presenter = getPresenterView(title: "Notes",isAddNew: true)
        
        let vMagic = MagicCollectionView.xibInstance()
        vMagic.frame = presenter.vContent.bounds
        vMagic.dictData = ["0":["Meeting","Meeting 1","Meeting 2","Meeting 3","Meeting 4","Meeting 5"]]
        vMagic.viewType = .extend_notes
        vMagic.controller = controller
        vMagic.collectionView.registerCell(ExtendedCollectionViewCell.self)
        vMagic.delegateAddSubView = self
        vMagic.heightCell = heightMediumCell
        vMagic.heightHeader = heightHeaderDefault
        
        presenter.vContent.addSubview(vMagic)
        presenter.delegate = self
        presenter.controller = controller
        
        self.addSubview(presenter)
    }
}

extension NotesView: XibInitalization {
    typealias Element = NotesView
}

extension NotesView: PresenterViewOutput {
    func onAddNew() {
        delegateAddSubView?.didAddNew(type: Extend_Type.notes.rawValue)
    }
    
    func onComplete(info dictObject: Dictionary<String, String>) {
        print(dictObject)
    }
}

extension NotesView: BaseViewOutput {
    func didAddNew(type: String) {
        let vc = UIViewController()
        let presenter = PresenterView.xibInstance()
        let notesDetail = NotesDetailView.xibInstance()
        
        vc.view.addSubview(presenter)
        presenter.frame = vc.view.bounds
        presenter.vTitle.lblTitle.text = "Note detail"
        presenter.onChangeAction(type: .edit)
        presenter.vContent.addSubview(notesDetail)
        notesDetail.frame = CGRect(x: paddingInsetsLarge.left, y: CGPoint.zero.y, width: presenter.vContent.bounds.width - paddingInsetsLarge.left*2, height: presenter.vContent.bounds.height)
    
        presenter.controller = controller
        presenter.delegate = vc
        controller?.onPushController(vc)
    }
    
    func onDetailView() {
        
    }

}
