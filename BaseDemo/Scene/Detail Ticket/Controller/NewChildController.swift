//
//  NewChildController.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import DropDown

class NewChildController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupView() {
        super.setupView()
        
        let present = PresenterView.xibInstance()
        present.vTitle.lblTitle.text = "New child ticket"
        present.frame = view.bounds
        view.addSubview(present)
        
        //FIXME
        let subView = MagicCollectionView.xibInstance()
        subView.dictData = ["0":["Contact name","Status","Subject","Description"]]
        subView.controller = self
        //account cell
        subView.collectionView.registerCell(AccountCollectionViewCell.self)

        subView.heightHeader = heightHeaderDefault
        subView.heightCell = heightLargeCell
        subView.viewType = .new_child
        subView.delegateAddSubView = self
        present.vContent.addSubview(subView)
        present.onChangeAction(type: .save)
        subView.frame = present.vContent.bounds
    }

}

extension NewChildController: BaseViewOutput {
    func didAddNew(type: String) {
        
    }
    
    func didAddPicklist(v: UIView?) {
        guard let cell = v as? AccountCollectionViewCell else { return }
        let arrContact = ["Le Thi Mit","Nguyen Van Teo"]
        let arrStatus = ["New","Processing","Escalated","Pending","Upcoming"]
        
        var arrDatasource : Array<String>
        
        switch cell.lblTitle.text! {
        case "Contact name":
            arrDatasource = arrContact
        case "Status":
            arrDatasource = arrStatus
        default:
            return
        }
        
        let dropDown = DropDown()
        dropDown.anchorView = cell
        
        
        dropDown.dataSource = arrDatasource
        dropDown.direction = .any
        dropDown.selectionAction = { (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            cell.tf.text = item
            dropDown.hide()
        }
        
        dropDown.show()
    }
}

extension NewChildController: XibInitalization {
    typealias Element = NewChildController
}
