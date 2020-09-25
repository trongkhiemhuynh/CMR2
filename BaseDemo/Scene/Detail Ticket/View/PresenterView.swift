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
}

class PresenterView: BaseView {
    
    /// outlet
    @IBOutlet private weak var btnAddNew: UIButton!
    @IBOutlet private weak var btnBack: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    weak var delegate: PresenterViewOutput?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func addNew() {
        delegate?.onAddNew()
    }
    
    public func hideAddNewBtn(on hide: Bool) -> Void {
        btnAddNew.isHidden = hide
    }
    
    public func hideBackBtn(on hide: Bool) -> Void {
        btnBack.isHidden = hide
    }
}

extension PresenterView: XibInitalization {
    typealias Element = PresenterView
}
