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
        vMagic.dictData = ["0":["Note","Note 1","Note 2","Note 3","Note 4","Note 5"]]
        vMagic.viewType = .notes
        vMagic.controller = controller
        vMagic.collectionView.registerCell(TicketDetailActivityCollectionViewCell.self)
        vMagic.delegateAddSubView = self
        vMagic.heightCell = 100.0
        vMagic.heightHeader = 20.0
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
        delegateAddSubView?.didAddNew(type: "notes")
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
        presenter.vContent.addSubview(notesDetail)
        notesDetail.frame = presenter.vContent.bounds
        
        presenter.controller = controller
        presenter.delegate = vc
        controller?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func onDetailView() {
        
    }
}

extension UIViewController: PresenterViewOutput {
    func onAddNew() {
        let vc = UIViewController()
        let presenter = PresenterView.xibInstance()
        let creatNote = CreatNewNote.xibInstance()
        creatNote.vTitle.isHidden = true
        creatNote.hideSave()
        creatNote.hideBack()
        vc.view.addSubview(presenter)
        presenter.frame = vc.view.bounds
        presenter.vTitle.lblTitle.text = "Edit note"
        presenter.vContent.addSubview(creatNote)
        creatNote.frame = presenter.vContent.bounds
        
        presenter.controller = self
        presenter.delegate = vc
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
