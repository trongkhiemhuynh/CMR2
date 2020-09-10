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
    public var itemsPerRow : CGFloat?
    
    public var arrCells : [MagicCollectionViewCell]?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.dataSource = magicDatasource
        magicDatasource.dictData = dictData
        magicDatasource.arrCells = arrCells
        
        collectionView.delegate = magicDelegate
        magicDelegate.heightCell = heightCell
        magicDelegate.itemsPerRow = itemsPerRow
        
        collectionView.registerCell(MagicCollectionViewCell.self)
    }
}

extension MagicCollectionView : XibInitalization {
    typealias Element = MagicCollectionView
}
