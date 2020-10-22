//
//  CustomDashboard.swift
//  BaseDemo
//
//  Created by macOS on 8/27/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

let totalHeight: CGFloat = 145.0
let statsHeight: CGFloat = 247.0
let openHeight: CGFloat = 191.0
let trafficHeight: CGFloat = 284.0
let dueHeight: CGFloat = 200.0
let assignHeight: CGFloat = 200.0

class SaleDashboard: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var v3 : UIView!
    @IBOutlet weak var v4 : UIView!
    
    @IBOutlet weak var v1 : UIView!
    @IBOutlet weak var v2 : UIView!
    
    //properties
    var arrView: [UIView] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.translatesAutoresizingMaskIntoConstraints = false
        print("---",frame, #function, NSStringFromClass(self.classForCoder))
        
        if let layout = collectionView.collectionViewLayout as? DashboardLayout {
            layout.delegate = self
        }
        
        collectionView.registerCell(DashboardTicketCollectionViewCell.self)
        collectionView.registerCell(DashboardStatsCollectionViewCell.self)
        collectionView.registerCell(DashboardOpenTicketCollectionViewCell.self)
        collectionView.registerCell(DashboardTrafficCollectionViewCell.self)
        collectionView.registerCell(DashboardDueTicketsCollectionViewCell.self)
        collectionView.registerCell(DashboardTicketsAssignCollectionViewCell.self)
//        collectionView.registerCell(DashboardTicketCollectionViewCell.self)
        collectionView.backgroundColor = Color.BackgroundListColor()
        
        let cell1 = DashboardTicketCollectionViewCell.xibInstance()
        let cell2 = DashboardStatsCollectionViewCell.xibInstance()
        let cell3 = DashboardOpenTicketCollectionViewCell.xibInstance()
        let cell4 = DashboardTrafficCollectionViewCell.xibInstance()
        
        let cell5 = DashboardDueTicketsCollectionViewCell.xibInstance()
        let cell6 = DashboardTicketsAssignCollectionViewCell.xibInstance()
        
        
        let width = widthScreen - sectionInsetsDefault.left*2
        let width2 = widthScreen/2 - sectionInsetsDefault.left*2
        
        cell1.frame = CGRect(origin: .zero, size: CGSize(width: width, height: totalHeight))
        cell2.frame = CGRect(origin: .zero, size: CGSize(width: width, height: statsHeight))
        cell3.frame = CGRect(origin: .zero, size: CGSize(width: width, height: openHeight))
        cell4.frame = CGRect(origin: .zero, size: CGSize(width: width, height: trafficHeight))
        cell5.frame = CGRect(origin: .zero, size: CGSize(width: width2, height: dueHeight))
        cell6.frame = CGRect(origin: .zero, size: CGSize(width: width2, height: assignHeight))
        
        arrView.append(cell1)
        arrView.append(cell2)
        arrView.append(cell3)
        arrView.append(cell4)
        arrView.append(cell5)
        arrView.append(cell6)
    }
    
    @objc func handleTapped( gesture : UITapGestureRecognizer){
        print("tapped !!!")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("-------",#function,String(describing: self))
        
        setupView()
    }
    
    func setupView(){
//         v1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTapped(gesture:))))
    }
}

extension SaleDashboard: XibInitalization {
    typealias Element = SaleDashboard
}

extension SaleDashboard: DashboardLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGSize {
        return arrView[indexPath.item].frame.size
    }
}

extension SaleDashboard: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardTicketCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardStatsCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardOpenTicketCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else if indexPath.row == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardTrafficCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else if indexPath.row == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardDueTicketsCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardTicketsAssignCollectionViewCell.identifier, for: indexPath)
            
            return cell
        }
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardTicketCollectionViewCell.identifier, for: indexPath)
//
//        return cell
    }

}


