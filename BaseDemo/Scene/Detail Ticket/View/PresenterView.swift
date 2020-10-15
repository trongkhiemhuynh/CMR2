//
//  PresenterView.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

@objc protocol PresenterViewOutput: class {
    func onAddNew()
    func onComplete()
    @objc optional func addNewAccount()
    @objc optional func addNewContact()
    @objc optional func addNewObject()
}

enum PresenterActionType {
    case add
    case save
    case edit
    case add_account
    case add_contact
    case add_object
}

class PresenterView: BaseView {
    
    /// outlet
    @IBOutlet private weak var btnAddNew: UIButton!
    @IBOutlet private weak var btnBack: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    weak var delegate: PresenterViewOutput?
    private var actionType: PresenterActionType = .add
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vContent.backgroundColor = Color.BackgroundListColor()
    }
    
    @IBAction func addNew() {
        switch actionType {
        case .add:
            delegate?.onAddNew()
        case .save:
            delegate?.onComplete()
        case .edit:
            delegate?.onAddNew()
        case .add_account:
            delegate?.addNewAccount!()
        case .add_contact:
            delegate?.addNewContact!()
        case .add_object:
            delegate?.addNewObject?()
        }
    }
    
    public func hideAddNewBtn(on hide: Bool) -> Void {
        btnAddNew.isHidden = hide
    }
    
    public func hideBackBtn(on hide: Bool) -> Void {
        btnBack.isHidden = hide
    }
    
    public func onChangeAction(type: PresenterActionType) {
        actionType = type
        
        switch type {
        case .add:
            btnAddNew.setImage(UIImage(named: "add_new"), for: .normal)
        case .edit:
            btnAddNew.setImage(UIImage(named: "edited"), for: .normal)
        case .save:
            btnAddNew.setImage(UIImage(named: "save"), for: .normal)
//        default:
        case .add_account:
            btnAddNew.setImage(UIImage(named: "add_new"), for: .normal)
        case .add_contact:
            btnAddNew.setImage(UIImage(named: "add_new"), for: .normal)
        case .add_object:
            btnAddNew.setImage(UIImage(named: "add_new"), for: .normal)
        }
    }
}

extension PresenterView: XibInitalization {
    typealias Element = PresenterView
}
