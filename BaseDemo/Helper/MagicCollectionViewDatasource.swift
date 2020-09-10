//
//  MagicCollectionViewDatasource.swift
//  BaseDemo
//
//  Created by macOS on 9/10/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import UIKit

class MagicCollectionViewDatasource: NSObject, UICollectionViewDataSource {
    
    public var dictData: Dictionary<String, Any>?
    public var arrCells : [UICollectionViewCell]?
    private var arrData : Array<String>?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dictData?.keys.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrData = dictData?[String(section)] as? Array<String>
        
        return arrData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MagicCollectionViewCell.identifier, for: indexPath) as! MagicCollectionViewCell
        cell.img.image = UIImage(named: "avatar")
        let arr = dictData?[String(indexPath.section)] as! Array<String>
        let title = arr[indexPath.row]
        
        cell.title.text = title
        cell.icRight.image = UIImage(named: "next")
        return cell
    }
}

class MagicCollectionViewDelegate : NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public var itemsPerRow : CGFloat?
    public var heightCell : CGFloat?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsetsDefault.left * ((itemsPerRow ?? 1) + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / (itemsPerRow ?? 1)
        
        return CGSize(width: widthPerItem, height: heightCell ?? heightDefaultCell)
    }
}


