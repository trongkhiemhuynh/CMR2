//
//  PresenterView.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol PresenterViewOutput: class {
    func onAddNew()
    func onComplete()
}

enum PresenterActionType {
    case add
    case save
    case edit
}

class PresenterView: BaseView {
    
    /// outlet
    @IBOutlet private weak var btnAddNew: UIButton!
    @IBOutlet private weak var btnBack: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    weak var delegate: PresenterViewOutput?
    var actionType: PresenterActionType = .add
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func addNew() {
        switch actionType {
        case .add:
            delegate?.onAddNew()
        case .save:
            delegate?.onComplete()
        case .edit:
            delegate?.onAddNew()
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
        }
    }
}

extension PresenterView: XibInitalization {
    typealias Element = PresenterView
}
