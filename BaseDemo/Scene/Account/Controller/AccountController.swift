//
//  AccountController.swift
//  BaseDemo
//
//  Created by macOS on 9/16/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import DropDown

class AccountController: BaseViewController {

    //variable
    let arrSubIndustry = ["Banking","Insurance","Consumer finance","Retail","Manufacturing","Professional service"]
    let arrSubDistrict = ["1","2","Binh Thanh","Thu Duc","Tan Phu"]
    let arrSubCity = ["Ha Noi","Ho Chi Minh","Da Nang"]
    let arrSubCountry = ["USA","England","France","Germany","Chinese","Viet Nam","Singapore"]
    
    //function
    override func viewDidLoad() {
        isHiddenNavigationBar = false
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        title = "Account"
        let subView = MagicCollectionView.xibInstance()
        subView.dictData = ["0":["Account Name","Industry","Primary phone","Assign to","Street address","District","City","Country","Description"]]
        subView.controller = self
        //account cell
        subView.collectionView.registerCell(AccountCollectionViewCell.self)
        subView.delegateAddSubView = self
        view.addSubview(subView)
        subView.frame = view.bounds
    }

}

extension AccountController: XibInitalization {
    typealias Element = AccountController
}

extension AccountController: BaseViewOutput {
    func didAddNew() {
        
    }
    
    func didAddPicklist(v: UIView?) {
        guard let cell = v as? AccountCollectionViewCell else { return }
        
        var arrDatasource : Array<String>
        
        switch cell.lblTitle.text! {
        case "Industry":
            arrDatasource = arrSubIndustry
        case "District":
            arrDatasource = arrSubDistrict
        case "City":
            arrDatasource = arrSubCity
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
