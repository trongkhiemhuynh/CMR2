//
//  AccountController.swift
//  BaseDemo
//
//  Created by macOS on 9/16/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import DropDown
import RealmSwift

class AccountDetailController: BaseViewController {

    //variable
//    let arrSubIndustry = ["Banking","Insurance","Consumer finance","Retail","Manufacturing","Professional service"]
//    let arrSubDistrict = ["1","2","Binh Thanh","Thu Duc","Tan Phu"]
//    let arrSubCity = ["Ha Noi","Ho Chi Minh","Da Nang"]
//    let arrSubCountry = ["Lao","Campuchia","Viet Nam","Singapore"]

    var dictObj: Dictionary<String, String>?
    //function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        var arrData: Array<String> = []
        
        switch viewType {
        case .account_detail:
            print("")
            if let arrKey = dictObj?.keys {
                for key in arrKey {
                    arrData.append(key)
                }
            } else {
                
            }
        case .account_new:
//            onLoading()
            
            guard let idObject = RealmManager.shared.onGetValue(with: "Account") else {return}
            
            Networking.shared.onCreatedForm(id: idObject) { (formObj) in
                
                Logger.info(Thread.isMainThread)
                if let formO = formObj as? LoadFormObj {
                    guard let arrField = formO.data?.first?.dat else {self.onDismissLoading(); return}
        
                    Logger.info(arrField.count)
                    for f in arrField {
                        Logger.info(f.name)
                        Logger.info(f.option?.count)
                        arrData.append(f.name ?? "#fixme")
                    }

                } else {
                    arrData = ["Account Name","Industry","Primary phone","Assign to","Street address","District","City","Country","Description"]
                }
                
                self.onDisplayView(arrData)
                
//                self.onDismissLoading()
            }

        default:
            print("say something")
        }
        
        
    }
    
    private func onDisplayView(_ arrData: Array<String>) {
        Logger.info(arrData.count)
        
        let isHideBtnSave = viewType == .account_detail ? true : false
        let present = PresenterView.xibInstance()
        present.frame = view.bounds
        
        switch viewType {
        case .account_detail:
            present.vTitle.lblTitle.text = "Account information"
        case .account_new:
            present.vTitle.lblTitle.text = "Creat new account"
        default:
            print("out of range")
        }
        
        present.controller = self
        
        present.hideAddNewBtn(on: isHideBtnSave)
        present.delegate = self
        present.onChangeAction(type: .save)
        
        view.addSubview(present)
        
        let subView = MagicCollectionView.xibInstance()
        
        subView.dictData = ["0": arrData]
        subView.dictVal = dictObj
        
        subView.controller = self
        //account cell
        subView.collectionView.registerCell(AccountCollectionViewCell.self)
        
        //        let accountView = AccountReusableView.xib()
        //subView.collectionView.register(accountView, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AccountReusableView.identifier)
        
        subView.heightHeader = heightHeaderDefault
        subView.heightCell = heightMediumCell
        subView.viewType = viewType
        subView.delegateAddSubView = self
        
        present.vContent.addSubview(subView)
        subView.frame = present.vContent.bounds
    }

}

extension AccountDetailController: XibInitalization {
    typealias Element = AccountDetailController
}

extension AccountDetailController: BaseViewOutput {
    func didAddNew(type: String) {
        
    }
    
    func didAddPicklist(v: UIView?) {
        guard let cell = v as? AccountCollectionViewCell else { return }
        
        var arrDatasource: Array<String> = []
        
//        switch cell.lblTitle.text! {
//        case "Industry":
//            arrDatasource = arrSubIndustry
//        case "District":
//            arrDatasource = arrSubDistrict
//        case "City":
//            arrDatasource = arrSubCity
//        case "Country":
//            arrDatasource = arrSubCountry
//        default:
//            print("fill text ")
//        }
        
        if arrDatasource.count > 0 {
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
}
