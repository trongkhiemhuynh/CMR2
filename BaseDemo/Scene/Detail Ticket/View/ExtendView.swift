//
//  TicketDetailExtendView.swift
//  BaseDemo
//
//  Created by khiemht on 8/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol TicketDetailExtendViewOutput: class {
    func didChooseExtendItem(_ item: String?)
}

class ExtendView: UIView {

    //outlet
    @IBOutlet weak var cvExtend: UICollectionView!
    @IBOutlet weak var vBound: UIView!
    @IBOutlet weak var vBackground: UIView!
    
    //variable
    private let itemsPerRow: CGFloat = 3
    weak var delegate: TicketDetailExtendViewOutput?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.cvExtend.backgroundColor = Color.BackgroundExtendColor()
        self.cvExtend.registerCell(ExtendCollectionViewCell.self)
        self.vBound.layer.cornerRadius = 12
        self.vBound.clipsToBounds = true
        
        self.vBackground.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView(_:))))
    }
    
    @objc func dismissView(_ gesture : UITapGestureRecognizer) {
//        ApplicationManager.sharedInstance.mainTabbar?.customTabbar.isHidden = false
        removeFromSuperview()
    }

}

extension ExtendView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = collectionView.cellForItem(at: indexPath) as! ExtendCollectionViewCell
        
        delegate?.didChooseExtendItem(item.lblEx.text)
        
        removeFromSuperview()
    }
}

extension ExtendView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = cvExtend.frame.width - paddingSpace
        let widthPerItem = availableWidth/itemsPerRow
        let heightPerItem = cvExtend.bounds.height/itemsPerRow - sectionInsetsDefault.left
        
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
}

extension ExtendView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExtendCollectionViewCell.identifier, for: indexPath) as! ExtendCollectionViewCell
        
        let title = arrExtends[indexPath.row]
        
        cell.onUpdate(text: title)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrExtends.count
    }
}

extension ExtendView: XibInitalization {
    typealias Element = ExtendView
}

