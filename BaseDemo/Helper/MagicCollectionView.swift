//
//  MagicCollectionView.swift
//  BaseDemo
//
//  Created by macOS on 9/10/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class MagicCollectionView: BaseView {
    // variable
    public let magicDatasource : MagicCollectionViewDatasource = MagicCollectionViewDatasource()
    public let magicDelegate : MagicCollectionViewDelegate = MagicCollectionViewDelegate()
    public var numberSection : Int?
    public var dictData : Dictionary<String, Any>?
    
    public var heightCell : CGFloat?
    public var itemsPerRow : CGFloat? = 1
    
    public var arrCells : [MagicCollectionViewCell]?
    public var heightHeader : CGFloat = 50
    public var heightHeaderProfile : CGFloat = 170
    
    public var heightContentProfile : CGFloat {
        return heightScreen - heightHeaderProfile
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.dataSource = magicDatasource
        magicDatasource.dictData = dictData
        magicDatasource.arrCells = arrCells
        
        collectionView.delegate = magicDelegate
        
        let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        
        
        // check kind controller
        if (controller?.isKind(of: ProfileViewController.self))! {
            magicDelegate.heightCell = heightContentProfile
            magicDatasource.type = .profile
            flowLayout?.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: heightHeaderProfile)
        } else {
            magicDelegate.heightCell = heightCell
            flowLayout?.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: heightHeader)
        }
        
        magicDelegate.itemsPerRow = itemsPerRow
        
        // register cell, header for settings
        collectionView.registerCell(MagicCollectionViewCell.self)
        collectionView.register(MagicHeaderCollectionReusableView.xib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MagicHeaderCollectionReusableView.identifier)
        
        // register cell, header for profile
        collectionView.registerCell(ProfileCollectionViewCell.self)
        collectionView.register(ProfileCollectionReusableView.xib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileCollectionReusableView.identifier)
        
        
        magicDelegate.delegate = self
    }
}

extension MagicCollectionView : MagicCollectionViewDelegateOutput {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //settings controller
        if (controller?.isKind(of: SettingViewController.self))! {
            let cell = collectionView.cellForItem(at: indexPath) as! MagicCollectionViewCell
            let vc = UIViewController()
            
            //title label
            let title = cell.title.text!
            vc.title = title
            
            if title == "Change Dashboard" {
//              let index = ApplicationManager.sharedInstance.templateDashboard.hashValue
                return
            }
            
            
            
            controller?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension MagicCollectionView : XibInitalization {
    typealias Element = MagicCollectionView
}
