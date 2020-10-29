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
    var itemsPerRow: CGFloat = 3
    var heightCell: CGFloat = 60
    var arrStage = ["New", "Processing", "Escalated", "Pending", "Upcoming"]
    var preIndexpath = IndexPath(row: 0, section: 0)
    
    override func commonInit() {
//        Bundle.main.loadNibNamed("CustomTicketStageView", owner: self, options: nil)
//        addSubview(vContent)
        
    }
    
    override func layoutSubviews() {
        Logger.info(self.bounds)
//        vContent.frame = self.bounds
    }
    
    public func setupLayout() {
        cvStage.indicatorStyle = .black
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsetsDefault
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsetsDefault.left
//    }
}

extension CustomTicketStageView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath != preIndexpath {
            // update index
            let cell = collectionView.cellForItem(at: indexPath) as? CustomTicketStageCollectionViewCell
            
            preIndexpath = indexPath
//            let preCell = collectionView.cellForItem(at: preIndexpath) as? CustomTicketStageCollectionViewCell
            
//            updateStatusStageTicket(cell,indexPath, true)
//            updateStatusStageTicket(preCell,preIndexpath, false)
//            cvStage.performBatchUpdates({
            cvStage.reloadData()
//            }) { (isUpdate) in
//                print(isUpdate)
//            }
            
            
            if let nameStage = cell?.lblStage.text {
                print(nameStage)
                delegate?.didChangeStage(name: nameStage)
            }
        }
    }
}
