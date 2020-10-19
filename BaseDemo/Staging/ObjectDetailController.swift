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
    var presenter: PresenterView!
    var subView: MagicCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func setupView() {
//        let isHideBtnSave = viewType == .account_detail ? true : false
        var arrData: Array<String> = []

        presenter = PresenterView.xibInstance()
        presenter.frame = view.bounds
        presenter.vTitle.lblTitle.text = "Information detail"
        presenter.controller = self
        
        presenter.hideAddNewBtn(on: false)
        presenter.delegate = self
//        present.hideAddNewBtn(on: true)
        presenter.onChangeAction(type: .edit)
        
        view.addSubview(presenter)
        
        subView = MagicCollectionView.xibInstance()
        
        
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
        
        presenter.vContent.addSubview(subView)
        subView.frame = presenter.vContent.bounds
    }
    
}

extension ObjectDetailController {
    func onEdit() {
        presenter.onChangeAction(type: .save)
        subView.viewType = .object_new
        subView.collectionView.reloadData()
    }
    
    override func onComplete(info dictObject: Dictionary<String, String>) {
        print(#file, #line, #function)
    }
}
