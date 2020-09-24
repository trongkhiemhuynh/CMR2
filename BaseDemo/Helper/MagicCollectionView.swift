//
//  MagicCollectionView.swift
//  BaseDemo
//
//  Created by macOS on 9/10/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import RealmSwift

class MagicCollectionView: BaseView {
    // variable
    public let magicDatasource : MagicCollectionViewDatasource = MagicCollectionViewDatasource()
    public let magicDelegate : MagicCollectionViewDelegate = MagicCollectionViewDelegate()
    public var numberSection : Int? = 1
    public var dictData : Dictionary<String, Any>?
    
    public var heightCell : CGFloat = 70 // default heightCell
    
    public var itemsPerRow : CGFloat = 1
    
    public var arrCells : [MagicCollectionViewCell]?
    public var heightDefaultHeader : CGFloat = 30
    public var heightProfileHeader : CGFloat = 170
    public var scrollDirection: UICollectionView.ScrollDirection = .vertical
    
    public var heightContentProfile : CGFloat {
        return heightScreen - heightProfileHeader
    }
    
    public var isClearBackground: Bool = false
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isClearBackground {
            self.collectionView.backgroundColor = .clear
        } else {
            self.collectionView.backgroundColor = BASEColor.BackgroundListColor()
        }
        
        collectionView.dataSource = magicDatasource
        collectionView.delegate = magicDelegate
        
        magicDatasource.dictData = dictData
        magicDatasource.arrCells = arrCells
        magicDelegate.delegate = self
        magicDelegate.heightCell = heightCell
        magicDelegate.itemsPerRow = itemsPerRow
        
        let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        flowLayout?.scrollDirection = scrollDirection
        // check kind controller
        guard let controller = controller else {
            return
        }

        if controller.isKind(of: ProfileViewController.self) {
            magicDelegate.heightCell = heightContentProfile
            magicDatasource.type = .profile
            flowLayout?.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: heightProfileHeader)
        } else if controller.isKind(of: AccountController.self) {
            magicDatasource.type = .account
            flowLayout?.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: heightDefaultHeader)
        } else {
            flowLayout?.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: heightDefaultHeader)
        }

        //register cell, header for settings
        collectionView.registerCell(MagicCollectionViewCell.self)
        collectionView.register(MagicHeaderCollectionReusableView.xib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MagicHeaderCollectionReusableView.identifier)
    }
}

extension MagicCollectionView : MagicCollectionViewDelegateOutput {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //settings controller
        
        guard let vc = controller else {
            return
        }
        
        if vc.isKind(of: SettingViewController.self) {
        
            let cell = collectionView.cellForItem(at: indexPath) as! MagicCollectionViewCell
//            let vc = UIViewController()
            
            //title label
            let title = cell.title.text!
//            vc.title = title
            let settingVC = vc as? SettingViewController
            settingVC?.showAlert(title: title, message: ALERT_TYPE.undefine.rawValue)
            
            if title == "Log out" {
                RouterManager.shared.handleRouter(LoginRoute())
                
                //realm
                let realm = try! Realm()
    
                try! realm.write {
                    realm.deleteAll()
                }
                
                return
            } else if title == "OCR" {
//                vc = OCRController()
            }
            
//            vc.navigationController?.pushViewController(vc, animated: true)
        } else if vc.isKind(of: ContactController.self) {
            RouterManager.shared.handleRouter(ContactDetailRoute())
        } else if controller!.isKind(of: AccountController.self) || controller!.isKind(of: ContactDetailController.self) {
            //deleate to superview
            let cell = collectionView.cellForItem(at: indexPath) as? AccountCollectionViewCell
            
            delegateAddSubView?.didAddPicklist!(v: cell)
        } else {
            Logger.info(controller?.nibName)
            delegateAddSubView?.didAddNew()
            delegateAddSubView?.onDetailView?()
        }
    }
}

extension MagicCollectionView: XibInitalization {
    typealias Element = MagicCollectionView
}
