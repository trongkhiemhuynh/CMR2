//
//  TicketDetailExtendView.swift
//  BaseDemo
//
//  Created by khiemht on 8/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TicketDetailExtendView: UIView {

    let identifyID = "ID"
    private let itemsPerRow: CGFloat = 3
    private let heightCell : CGFloat = 70
    
    private let sectionInsets = UIEdgeInsets(top: 10.0,
    left: 10.0,
    bottom: 10.0,
    right: 10.0)
    
    @IBOutlet weak var cvExtend : UICollectionView!
    @IBOutlet weak var vBound : UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
//        self.cvExtend.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifyID)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.cvExtend.backgroundColor = BASEColor.BackgroundExtendColor()
        self.cvExtend.register(UINib(nibName: "ExtendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifyID)
        self.vBound.layer.cornerRadius = 12
        self.vBound.clipsToBounds = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView(_:))))
    }
    
    @objc func dismissView(_ gesture : UITapGestureRecognizer) {
        removeFromSuperview()
    }

}

extension TicketDetailExtendView : UICollectionViewDelegate {
    
}

extension TicketDetailExtendView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = cvExtend.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension TicketDetailExtendView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifyID, for: indexPath) as! ExtendCollectionViewCell
        cell.lblEx.text = "Acitivity History"
        cell.imgEx.image = UIImage(named: "setting_selected")
        
        cell.backgroundColor = .clear
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
}

