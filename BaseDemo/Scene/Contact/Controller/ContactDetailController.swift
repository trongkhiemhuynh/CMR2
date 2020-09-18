//
//  ContactDetailController.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import DropDown

class ContactDetailController: BaseViewController {

    //variable
    var arrSubDepartment = ["Sales","Marketing","Support","Implementation","Accounting"]
    
    //function
    override func viewDidLoad() {
        isHiddenNavigationBar = false
        super.viewDidLoad()
        title = "Contact Detail"
        // Do any additional setup after loading the view.
    }

    override func setupView() {
        let magicView = MagicCollectionView.xibInstance()
        view.addSubview(magicView)
        magicView.controller = self

        magicView.dictData = ["0":["First Name","Last Name","Full Name","Account Name","Office Phone","Mobile Phone","Email","Title","Department","Description"]]
        magicView.collectionView.registerCell(AccountCollectionViewCell.self)
        magicView.delegateAddSubView = self
        magicView.magicDatasource.type = .contact_detail
        magicView.frame = view.bounds
    }

}

extension ContactDetailController: XibInitalization {
    typealias Element = ContactDetailController
}

extension ContactDetailController: BaseViewOutput {
    func didAddNew() {
        
    }
    
    func didAddPicklist(v: UIView?) {
        guard let cell = v as? AccountCollectionViewCell else { return }
        
        var arrDatasource : Array<String>
        
        switch cell.lblTitle.text! {
        case "Department":
            arrDatasource = arrSubDepartment
        case "Account Name":
            RouterManager.shared.handleRouter(AccountRoute())
            return
        default:
            return
        }
        
        let dropDown = DropDown()
        dropDown.anchorView = cell
        
        
        dropDown.dataSource = arrDatasource
        dropDown.direction = .any
        dropDown.selectionAction = { (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            cell.lblName.text = item
            dropDown.hide()
        }
        
        dropDown.show()
    }
}
