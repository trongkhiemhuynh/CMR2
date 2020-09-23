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
    
    @IBOutlet weak var btnAddNew: UIButton!
    
    weak var delegate: PresenterViewOutput?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func addNew() {
        delegate?.onAddNew()
    }
}

extension PresenterView: XibInitalization {
    typealias Element = PresenterView
}
