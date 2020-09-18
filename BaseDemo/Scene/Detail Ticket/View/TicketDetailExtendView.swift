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

class TicketDetailExtendView: UIView {

    //outlet
    @IBOutlet weak var cvExtend : UICollectionView!
    @IBOutlet weak var vBound : UIView!
    @IBOutlet weak var vBackground : UIView!
    
    //variable
    private let itemsPerRow: CGFloat = 3
    weak var delegate: TicketDetailExtendViewOutput?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
//        self.cvExtend.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifyID)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.cvExtend.backgroundColor = BASEColor.BackgroundExtendColor()
        self.cvExtend.registerCell(ExtendCollectionViewCell.self)
//        self.cvExtend.register(UINib(nibName: "ExtendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifyID)
        self.vBound.layer.cornerRadius = 12
        self.vBound.clipsToBounds = true
        
        self.vBackground.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView(_:))))
    }
    
    @objc func dismissView(_ gesture : UITapGestureRecognizer) {
        ApplicationManager.sharedInstance.mainTabbar?.customTabbar.isHidden = false
        removeFromSuperview()
    }

}

extension TicketDetailExtendView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = collectionView.cellForItem(at: indexPath) as! ExtendCollectionViewCell
        
        delegate?.didChooseExtendItem(item.lblEx.text)
        
        removeFromSuperview()
    }
}

extension TicketDetailExtendView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = cvExtend.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: vBound.frame.size.height/itemsPerRow)
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsetsDefault.left
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsetsDefault.left
//    }
}

extension TicketDetailExtendView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExtendCollectionViewCell.identifier, for: indexPath) as! ExtendCollectionViewCell
        
        let title = arrExtends[indexPath.row]
        
        cell.lblEx.text = title
        
        let imageName = "menu_\(title.lowercased().replacingOccurrences(of: " ", with: "_"))"
        
        cell.imgEx.image = UIImage(named: imageName)
        
        cell.backgroundColor = .clear

        return cell        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrExtends.count
    }
}

extension TicketDetailExtendView : XibInitalization {
    typealias Element = TicketDetailExtendView
}

