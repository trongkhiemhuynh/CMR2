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
    
    @IBOutlet weak var cvExtend : UICollectionView!
    
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
    
    @objc func dismissView(_ gesture : UITapGestureRecognizer) {
        removeFromSuperview()
    }

}

extension TicketDetailExtendView : UICollectionViewDelegate {
    
}

extension TicketDetailExtendView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: 50, height: 50)
        
        return size
    }
}

extension TicketDetailExtendView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifyID, for: indexPath)
        
        cell.backgroundColor = .red
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

