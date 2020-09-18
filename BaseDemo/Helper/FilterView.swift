//
//  FiilterView.swift
//  BaseDemo
//
//  Created by macOS on 9/1/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class FilterView : BaseView {
    
    //dummy Data
    var dummy = ["Subject","From","To","Characters","From date","To date","Search"]
    
    @IBAction func didClose() {
        removeFromSuperview()
    }
    
    @IBAction func didClear() {
        // clear field
    }
    
    /// filter
    @IBAction func didFilter() {
        // action filter
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.registerCell(FilterCollectionViewCell.self)
    }
    
    
}

extension FilterView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as! FilterCollectionViewCell
        cell.tf.placeholder = dummy[indexPath.row]
        
        if cell.tf.placeholder!.contains("date") {
            cell.iv.isHidden = false
        }
        
        return cell
    }
}

extension FilterView : UICollectionViewDelegate {
    
}

extension FilterView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightLargeCell)
    }
}

extension FilterView : XibInitalization {
    typealias Element = FilterView
}
