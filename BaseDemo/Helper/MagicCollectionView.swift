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
    private let magicDatasource: MagicCollectionViewDatasource = MagicCollectionViewDatasource()
    private let magicDelegate: MagicCollectionViewDelegate = MagicCollectionViewDelegate()
    public var numberSection: Int? = 1
    public var dictData: Dictionary<String, Any>?
    
    public var heightCell: CGFloat = heightDefaultCell // default heightCell
    public var heightHeader: CGFloat = heightHeaderDefault
    public var itemsPerRow: CGFloat = 1
    public var viewType: MagicView = .setting
    public var arrCells: [MagicCollectionViewCell]?
    
    public var scrollDirection: UICollectionView.ScrollDirection = .vertical

    public var isClearBackground: Bool = false
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func setupLayout() {
        if isClearBackground {
            self.collectionView.backgroundColor = .clear
            self.backgroundColor = .clear
        } else {
            self.collectionView.backgroundColor = Color.BackgroundListColor()
        }
        
        collectionView.dataSource = magicDatasource
        collectionView.delegate = magicDelegate
        magicDelegate.delegate = self
        
        magicDatasource.dictData = dictData
        magicDatasource.arrCells = arrCells
        magicDatasource.type = viewType
        magicDelegate.heightCell = heightCell
        magicDelegate.itemsPerRow = itemsPerRow
        magicDelegate.collectionView = collectionView
        
        let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        flowLayout?.scrollDirection = scrollDirection
        flowLayout?.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: heightHeader)

        //register cell, header for settings
        collectionView.registerCell(MagicCollectionViewCell.self)
        collectionView.register(MagicHeaderCollectionReusableView.xib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MagicHeaderCollectionReusableView.identifier)
        
        self.addTapDismissKeyboard()
    }
}

extension MagicCollectionView: MagicCollectionViewDelegateOutput {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //settings controller
        
        switch viewType {
        case .account_list:
            RouterManager.shared.handleRouter(AccountRoute())
            return
        case .setting:
            let cell = collectionView.cellForItem(at: indexPath) as! MagicCollectionViewCell
            let title = cell.title.text!
            
            if title == SettingType.ocr.rawValue {
                //                vc = OCRController()
            } else if title == SettingType.jabber.rawValue {
                Logger.info(title)
            }
            return
        case .account,.contact_detail,.new_child:
            let cell = collectionView.cellForItem(at: indexPath) as? AccountCollectionViewCell
            delegateAddSubView?.didAddPicklist!(v: cell)
            return
        case .contact:
            RouterManager.shared.handleRouter(ContactDetailRoute())
            return
        default:
            print(viewType)
            delegateAddSubView?.didAddNew(type: Extend_Type.notes.rawValue)
            delegateAddSubView?.onDetailView?()
        }
    }
}

extension MagicCollectionView: XibInitalization {
    typealias Element = MagicCollectionView
}
