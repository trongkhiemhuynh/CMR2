//
//  CustomTicketStageView.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomTicketStageView: BaseView {

    @IBOutlet weak var cvStage: UICollectionView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let reuseId = "CellStageTicket"
    private let sectionInsets = UIEdgeInsets(top: 10.0,
                                             left: 10.0,
                                             bottom: 10.0,
                                             right: 10.0)
    private let itemsPerRow: CGFloat = 3
    private let heightCell : CGFloat = 60
    private let arrStage = ["New", "Processing", "Escalated", "Pending", "Upcoming"]
    
    private let mockup = ["New":true, "Processing":false, "Escalated":false, "Pending":false, "Upcoming":false]
    
    private var preIdx = IndexPath(row: 0, section: 0)
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomTicketStageView", owner: self, options: nil)
        vContent.frame = self.bounds
        addSubview(vContent)
        
        cvStage.register(UINib(nibName: "CustomTicketStageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseId)
    }

}

extension CustomTicketStageView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrStage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! CustomTicketStageCollectionViewCell
        
        let strStage = arrStage[indexPath.row]
        
        cell.lblStage.text = strStage
        if indexPath == preIdx {
            cell.imgStage.isHidden = false
        } else {
            cell.imgStage.isHidden = true
        }
        
        return cell
    }
}

extension CustomTicketStageView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = cvStage.frame.width - paddingSpace
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

extension CustomTicketStageView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath != preIdx {
            
            let pCell = collectionView.cellForItem(at: preIdx) as? CustomTicketStageCollectionViewCell
            
            pCell?.imgStage.isHidden = true
            
            preIdx = indexPath
            
            let cell = collectionView.cellForItem(at: indexPath) as? CustomTicketStageCollectionViewCell
            
            cell?.imgStage.isHidden = false
        }
        
        NotificationCenter.default.post(name: .StageName, object: nil)
        
    }
}
