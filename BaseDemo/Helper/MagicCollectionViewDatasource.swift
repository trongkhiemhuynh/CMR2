//
//  MagicCollectionViewDatasource.swift
//  BaseDemo
//
//  Created by macOS on 9/10/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import UIKit

protocol MagicCollectionViewDelegateOutput: class {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

enum MAGICDATASOURCETYPE {
    case setting
    case profile
}

class MagicCollectionViewDatasource: NSObject, UICollectionViewDataSource {
    //variable
    public var dictData: Dictionary<String, Any>?
    public var arrCells : [UICollectionViewCell]?
    private var arrData : Array<String>?
    public var type : MAGICDATASOURCETYPE = .setting

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Logger.info(dictData?.keys)
        return dictData?.keys.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrData = dictData?[String(section)] as? Array<String>
        
        return arrData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if type == .setting {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MagicCollectionViewCell.identifier, for: indexPath) as! MagicCollectionViewCell
            cell.img.image = UIImage(named: "avatar")
            cell.vImg.isHidden = true

            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            
            cell.title.text = title
            cell.icRight.image = UIImage(named: "next")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as! ProfileCollectionViewCell
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if type == .setting {
            let headerView  = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MagicHeaderCollectionReusableView.identifier, for: indexPath) as! MagicHeaderCollectionReusableView
            
            headerView.backgroundColor = BASEColor.BackgroundListColor()
            headerView.lblSection.text = ""
            
            return headerView
        } else {
            let headerView  = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileCollectionReusableView.identifier, for: indexPath) as! ProfileCollectionReusableView
            
            return headerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if type == .setting {
            return CGSize(width: widthScreen, height: 50)
        } else {
            return CGSize(width: widthScreen, height: heightScreen - 170)
        }
    }
}

class MagicCollectionViewDelegate : NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public var itemsPerRow : CGFloat?
    public var heightCell : CGFloat?
    
    // delegate
    weak var delegate: MagicCollectionViewDelegateOutput?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsetsDefault.left * ((itemsPerRow ?? 1) + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / (itemsPerRow ?? 1)
        
        return CGSize(width: widthPerItem, height: heightCell ?? heightDefaultCell)
    }
}


