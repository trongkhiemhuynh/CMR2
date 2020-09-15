//
//  CustomTicketStageView.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol CustomTicketStageViewOutput: class {
    func didChangeStage(name: String?)
}

class CustomTicketStageView: BaseView {

    // delegate
    weak var delegate: CustomTicketStageViewOutput?
    
    // outlet
    @IBOutlet weak var cvStage: UICollectionView!

    // private variable
    private let itemsPerRow: CGFloat = 3
    private let heightCell: CGFloat = 60
    private let arrStage = ["New", "Processing", "Escalated", "Pending", "Upcoming"]
    private var preIndexpath = IndexPath(row: 0, section: 0)
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomTicketStageView", owner: self, options: nil)
        vContent.frame = self.bounds
        addSubview(vContent)
        cvStage.indicatorStyle = .white
        cvStage.backgroundColor = .white
        cvStage.registerCell(CustomTicketStageCollectionViewCell.self)
    }

}

extension CustomTicketStageView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrStage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTicketStageCollectionViewCell.identifier, for: indexPath) as! CustomTicketStageCollectionViewCell
        
        let strStage = arrStage[indexPath.row]
        
        cell.lblStage.text = strStage
        let isSelected = indexPath == preIndexpath
        cell.didUpdate(isSelected)
//        updateStatusStageTicket(cell, indexPath, indexPath == preIndexpath)
        
        return cell
    }
}

extension CustomTicketStageView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //2
        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = cvStage.frame.width - paddingSpace
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

extension CustomTicketStageView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath != preIndexpath {
            // update index
            preIndexpath = indexPath
//            let preCell = collectionView.cellForItem(at: preIndexpath) as? CustomTicketStageCollectionViewCell
            
//            updateStatusStageTicket(cell,indexPath, true)
//            updateStatusStageTicket(preCell,preIndexpath, false)
//            cvStage.performBatchUpdates({
            cvStage.reloadData()
//            }) { (isUpdate) in
//                print(isUpdate)
//            }
            
            let cell = collectionView.cellForItem(at: indexPath) as? CustomTicketStageCollectionViewCell
            let nameStage = cell?.lblStage.text
            
            delegate?.didChangeStage(name: nameStage)
        }
    }
}
