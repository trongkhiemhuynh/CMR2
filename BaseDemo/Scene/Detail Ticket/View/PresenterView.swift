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
    func onComplete(info dictObject: Dictionary<String, String>)
    
    @objc optional func onEdit()
    @objc optional func addNewAccount()
    @objc optional func addNewContact()
    @objc optional func addNewObject()
}

enum PresenterActionType {
    case none
    case add
    case save
    case edit
//    case add_account
//    case add_contact
    case object_add
}

class PresenterView: BaseView {
    
    /// outlet
    @IBOutlet private weak var btnAddNew: UIButton!
    @IBOutlet private weak var btnBack: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    weak var delegate: PresenterViewOutput?
    private var actionType: PresenterActionType = .add
    public var dictDataCollect: Dictionary<String, String>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //init
        self.vContent.backgroundColor = Color.BackgroundListColor()
        dictDataCollect = Dictionary()
    }
    
    @IBAction func addNew() {
        switch actionType {
        case .add:
            delegate?.onAddNew()
        case .save:
            delegate?.onComplete(info: dictDataCollect!)
        case .edit:
            delegate?.onEdit?()
//        case .add_account:
//            delegate?.addNewAccount!()
//        case .add_contact:
//            delegate?.addNewContact!()
        case .object_add:
            delegate?.addNewObject?()
        case .none:
            print("do not disturb")
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
//        case .add_account:
//            btnAddNew.setImage(UIImage(named: "add_new"), for: .normal)
//        case .add_contact:
//            btnAddNew.setImage(UIImage(named: "add_new"), for: .normal)
        case .object_add:
            btnAddNew.setImage(UIImage(named: "add_new"), for: .normal)
        case .none:
            btnAddNew.isHidden = true
        }
    }
}

extension PresenterView: XibInitalization {
    typealias Element = PresenterView
}
