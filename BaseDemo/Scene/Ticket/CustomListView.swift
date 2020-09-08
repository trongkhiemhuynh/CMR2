//
//  CustomListView.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomListView: BaseView {

    private let itemsPerRow: CGFloat = 1
    private let heightCell : CGFloat = 80
    
    @IBOutlet weak var lblCount : UILabel!

    @IBOutlet weak var btnSorted : UIButton!
    @IBOutlet weak var vCounted : UIView!
    @IBOutlet weak var vSorted : UIView!
    
    @IBOutlet weak var cvList : UICollectionView!
    @IBOutlet weak var vBgList : UIView!
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomListView", owner: self, options: nil)
        addSubview(vContent)
        
        vContent.frame = self.bounds

        vSorted.layer.cornerRadius = 12
        vCounted.layer.cornerRadius = 12

        cvList.registerCell(CustomTicketCollectionViewCell.self)
        
        cvList.backgroundColor = BASEColor.BackgroundListColor()
        vBgList.backgroundColor = BASEColor.BackgroundListColor()
        vContent.backgroundColor = BASEColor.BackgroundListColor()
    }
    
    @IBAction func changeSort() {
        NotificationCenter.default.post(name: .ChangeSort, object: nil)
    }

}

extension CustomListView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTicketCollectionViewCell.identifier, for: indexPath) as! CustomTicketCollectionViewCell
        
        cell.updateData(TicketListModel(name: "Nguyen", id: "123456", status: "Support"))
        
        return cell
    }
}

extension CustomListView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: .DetailTicket, object: nil)
    }
}

extension CustomListView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //2
        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = cvList.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightCell)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsetsDefault
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsetsDefault.left
    }
}
