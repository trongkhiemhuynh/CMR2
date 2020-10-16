//
//  MainViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class ObjectDetailController: BaseViewController {
    
    var dictObj: Dictionary<String, String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func setupView() {
//        let isHideBtnSave = viewType == .account_detail ? true : false
        let present = PresenterView.xibInstance()
        present.frame = view.bounds
        present.vTitle.lblTitle.text = "Information detail"
        present.controller = self
        
        present.hideAddNewBtn(on: true)
        present.delegate = self
        present.onChangeAction(type: .save)
        
        view.addSubview(present)
        
        let subView = MagicCollectionView.xibInstance()
        var arrData: Array<String> = []
        
        if let arrKey = dictObj?.keys {
            for key in arrKey {
                arrData.append(key)
            }
        } else {
            
        }
        
        //            switch viewType {
        //            case .account_detail:
        //                print("")
        //                if let arrKey = dictObj?.keys {
        //                    for key in arrKey {
        //                        arrData.append(key)
        //                    }
        //                } else {
        //
        //                }
        //            case .account_new:
        //                arrData = ["Account Name","Industry","Primary phone","Assign to","Street address","District","City","Country","Description"]
        //            default:
        //                print("say something")
        //            }
        
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
//        subView.delegateAddSubView = self
        
        present.vContent.addSubview(subView)
        subView.frame = present.vContent.bounds
    }
    
}
