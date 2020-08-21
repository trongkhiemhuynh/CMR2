//
//  CustomListView.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomListView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let reuseId = "CellListTicket"
    private let sectionInsets = UIEdgeInsets(top: 20.0,
                                             left: 20.0,
                                             bottom: 20.0,
                                             right: 20.0)
    private let itemsPerRow: CGFloat = 1
    private let heightCell : CGFloat = 80
    
    @IBOutlet weak var lblCount : UILabel!

    @IBOutlet weak var btnSorted : UIButton!
    @IBOutlet weak var vCounted : UIView!
    @IBOutlet weak var vSorted : UIView!
    
    @IBOutlet weak var cvList : UICollectionView!
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomListView", owner: self, options: nil)
        addSubview(vContent)
        
        vContent.frame = self.bounds
        cvList.backgroundColor = UIColor(red: 243.0, green: 243.0, blue: 243.0)
        vSorted.layer.cornerRadius = 8
        vCounted.layer.cornerRadius = 8
        
        cvList.register(UINib(nibName: "CustomTicketCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseId)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! CustomTicketCollectionViewCell
        
        cell.lblID.text = "1234"
        cell.lblStatus.text = "Support call"
        cell.lblName.text = "Steve"
        
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
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = cvList.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightCell)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
