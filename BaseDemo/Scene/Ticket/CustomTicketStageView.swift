//
//  CustomTicketStageView.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol CustomTicketStageViewOutput: class {
    func didChangeStage(name: String)
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

        updateStatusStageTicket(cell, indexPath, indexPath == preIndexpath)
        
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
    fileprivate func updateStatusStageTicket(_ cell: CustomTicketStageCollectionViewCell,_ indexPath: IndexPath,_ isSelected : Bool) {
        if isSelected {
            // currently selection

            // update title bold and image bottom line
            cell.imgStage.isHidden = false
            cell.lblStage.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.lblStage.textColor = BASEColor.MainAppColor()
        } else {
            // previously selection

            cell.imgStage.isHidden = true
            cell.lblStage.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
            cell.lblStage.textColor = BASEColor.TextTitleColor
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath != preIndexpath {
            let cell = collectionView.cellForItem(at: indexPath) as! CustomTicketStageCollectionViewCell
            let preCell = collectionView.cellForItem(at: preIndexpath) as! CustomTicketStageCollectionViewCell
            
            updateStatusStageTicket(cell,indexPath, true)
            updateStatusStageTicket(preCell,preIndexpath, false)

            cvStage.reloadItems(at: [indexPath,preIndexpath])
            // update index
            preIndexpath = indexPath
            
            let nameStage = cell.lblStage.text
            
            delegate?.didChangeStage(name: nameStage!)
        }
    }
}
