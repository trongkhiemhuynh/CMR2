//
//  ObjectNewController.swift
//  BaseDemo
//
//  Created by macOS on 10/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import DropDown

class ObjectNewController: BaseViewController {

    var arrData: Array<DatObj>!
    var dictData: Dictionary<String, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        
    }
    
    override func initData() {
        arrData = Array()
        dictData = Dictionary()
        //get name object
        
        guard let idObject = RealmManager.shared.onGetIDObject() else {return}
        
        onLoading()
        Networking.shared.onCreatedForm(id: idObject) { (formObj) in
            
            Logger.info(Thread.isMainThread)
            if let formO = formObj as? LoadFormObj {
                guard let arrField = formO.data?.first?.dat else {self.onDismissLoading(); return}
                
                Logger.info(arrField.count)
                for f in arrField {
                    Logger.info(f.name)
                    Logger.info(f.option?.count)

                    self.arrData?.append(f)
                }
                
            } else {
//                arrData = ["Account Name","Industry","Primary phone","Assign to","Street address","District","City","Country","Description"]
            }
            
            self.onDisplayView(self.arrData!)
            
            self.onDismissLoading()
        }
    }
    
    
    private func onDisplayView(_ arrData: Array<DatObj>) {
        Logger.info(arrData.count)
        
        //        let isHideBtnSave = viewType == .account_detail ? true : false
        let present = PresenterView.xibInstance()
        present.frame = view.bounds
        present.vTitle.lblTitle.text = "Creat new"
        //        switch viewType {
        //        case .account_detail:
        //            present.vTitle.lblTitle.text = "Account information"
        //        case .account_new:
        //            present.vTitle.lblTitle.text = "Creat new account"
        //        default:
        //            print("out of range")
        //        }
        
        present.controller = self
        
        //        present.hideAddNewBtn(on: isHideBtnSave)
        present.delegate = self
        present.onChangeAction(type: .save)
        
        view.addSubview(present)
        
        let subView = MagicCollectionView.xibInstance()
        
        subView.dictData = ["0": arrData]
        
        subView.controller = self
        //account cell
        subView.collectionView.registerCell(AccountCollectionViewCell.self)
        
        //        let accountView = AccountReusableView.xib()
        //subView.collectionView.register(accountView, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AccountReusableView.identifier
        subView.heightHeader = heightHeaderDefault
        subView.heightCell = heightMediumCell
        subView.viewType = viewType
        
        present.vContent.addSubview(subView)
        subView.frame = present.vContent.bounds
    }

}

extension ObjectNewController: TicketDetailInputInfoCollectionViewCellOutput {
    func didEndEdit(titleField: String, inputField: String) {
        dictData[titleField] = inputField
        
    }
    
    func onFrameCell(_ cell: UICollectionViewCell) {
        guard let c = cell as? AccountCollectionViewCell else {return}
        
        //get name title
        //compare to array
        //promt dropdown
        
        let nameTitle = c.lblTitle.text
        
        for i in arrData {
            if i.name?.lowercased() == nameTitle?.lowercased() {
                guard let arrDropdown = i.option else {return}
                
                var arrDatasource = Array<String>()
                for item in arrDropdown {
                    arrDatasource.append(item.value!)
                }
                
                if arrDatasource.count > 0 {
                    let dropDown = DropDown()
                    dropDown.anchorView = cell
                    dropDown.dataSource = arrDatasource
                    dropDown.direction = .bottom
                    dropDown.selectionAction = { (index: Int, item: String) in
                        print("Selected item: \(item) at index: \(index)")
                        c.tf.text = item
                        dropDown.hide()
                    }
                    
                    dropDown.show()
                }
                
                break
            }
            
        }
    }
    
    override func onComplete(info dictObject: Dictionary<String, String>) {
        print(dictData)
        //verify all field
        for k in dictData.keys {
            if dictData[k]!.isEmpty {
                showAlert(title: "ALERT!", message: "Please fill in required fields.")
                return
            }
        }
        
        //FIXME request to server object new
    
        
    }
//    override func onComplete(info: <#type#> ) {
//        //post api creat new object
//
//    }
}
