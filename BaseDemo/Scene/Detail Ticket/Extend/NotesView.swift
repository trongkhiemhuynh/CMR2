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
    func onComplete() {
        
    }
    
    func onAddNew() {
        delegateAddSubView?.didAddNew(type: Extend_Type.notes.rawValue)
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

extension UIViewController: PresenterViewOutput {
    func onComplete() {
        //show qa
        let vSuccess = Bundle.main.loadNibNamed("PopupView", owner: self, options: nil)?[1] as! PopUpSuccessful
        
        self.view.addSubview(vSuccess)
        vSuccess.frame = self.view.bounds
        
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .allowAnimatedContent, animations: {
            self.view.layoutIfNeeded()
        }) { (_) in
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
            vSuccess.removeFromSuperview()
            self.didPopView()
        }
    }
    
    func onAddNew() {
        let vc = UIViewController()
        let presenter = PresenterView.xibInstance()
        presenter.vTitle.lblTitle.text = "Edit note"
        
        let creatNote = CreatNewNote.xibInstance()
        creatNote.hideSave()
        creatNote.hideBack()
        creatNote.vTitleView.isHidden = true
        creatNote.frame = CGRect(x: sectionInsetsDefault.left, y: CGPoint.zero.y, width: presenter.vContent.bounds.width - sectionInsetsDefault.left*2, height: presenter.vContent.bounds.height)
            
        vc.view.addSubview(presenter)
        presenter.frame = vc.view.bounds
        
        presenter.onChangeAction(type: .save)
        presenter.vContent.addSubview(creatNote)
        
        presenter.controller = self
        presenter.delegate = vc
        onPushController(vc)
    }
    
    func generateView(subView: UIView, title: String?, actionType: PresenterActionType) {
        let vc = UIViewController()
        let presenter = PresenterView.xibInstance()
        presenter.vTitle.lblTitle.text = title
        
        subView.frame = CGRect(x: CGPoint.zero.x, y: CGPoint.zero.y, width: presenter.vContent.bounds.width, height: presenter.vContent.bounds.height)
            
        vc.view.addSubview(presenter)
        presenter.frame = vc.view.bounds
        
        presenter.onChangeAction(type: actionType)
        presenter.vContent.addSubview(subView)
        
        presenter.controller = self
        presenter.delegate = vc
        
        onPushController(vc)
    }
    
    func addNewAccount() {
        let route = AccountRoute()
        RouterManager.shared.handleRouter(route)
        
        route.handleData { (vc) in
            vc.viewType = .account_new
        }
    }
    
    func addNewContact() {
        let route = ContactDetailRoute()
        RouterManager.shared.handleRouter(route)
        
        route.handleData { (vc) in
            vc.viewType = .contact_new
        }
    }
    
    public func onPushController(_ controller: UIViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
