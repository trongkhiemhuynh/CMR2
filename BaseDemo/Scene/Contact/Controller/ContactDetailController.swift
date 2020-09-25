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
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        let present = PresenterView.xibInstance()
        present.frame = view.bounds
        present.vTitle.lblTitle.text = "Contact"
        present.controller = self
        present.hideAddNewBtn(on: true)
        view.addSubview(present)
        
        let subView = MagicCollectionView.xibInstance()
        subView.dictData = ["0":["First Name","Last Name","Full Name","Account Name","Office Phone","Mobile Phone","Email","Title","Department","Description"]]
        subView.controller = self
        //account cell
        subView.collectionView.registerCell(AccountCollectionViewCell.self)
        
        subView.collectionView.register(AccountReusableView.xib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AccountReusableView.identifier)

        subView.heightDefaultHeader = 150.0
        subView.magicDatasource.type = .account
        subView.delegateAddSubView = self
        present.vContent.addSubview(subView)
        subView.frame = present.vContent.bounds
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
