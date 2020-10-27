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


enum DashBoardCell: String {
    case ticket = "DashboardTicketCollectionViewCell"
    case stats = "DashboardStatsCollectionViewCell"
    case open = "DashboardOpenTicketCollectionViewCell"
    case traffic = "DashboardTrafficCollectionViewCell"
    case due = "DashboardDueTicketsCollectionViewCell"
    case assign = "DashboardTicketsAssignCollectionViewCell"
    case article = "TBD"
}

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
    
    //properties
    var arrView: [UIView] = []
    let widthFull = widthScreen - sectionInsetsDefault.left*2
    let widthHalf = widthScreen/2 - sectionInsetsDefault.left*2
    private var dashboardLayout: DashboardLayout?
    private var vAddItem: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.translatesAutoresizingMaskIntoConstraints = false
        print("---",frame, #function, NSStringFromClass(self.classForCoder))
        
        if let layout = collectionView.collectionViewLayout as? DashboardLayout {
            dashboardLayout = layout
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

        cell1.frame = CGRect(origin: .zero, size: CGSize(width: widthFull, height: totalHeight))
        cell2.frame = CGRect(origin: .zero, size: CGSize(width: widthFull, height: statsHeight))
        cell3.frame = CGRect(origin: .zero, size: CGSize(width: widthFull, height: openHeight))
        cell4.frame = CGRect(origin: .zero, size: CGSize(width: widthFull, height: trafficHeight))
        cell5.frame = CGRect(origin: .zero, size: CGSize(width: widthHalf, height: dueHeight))
        cell6.frame = CGRect(origin: .zero, size: CGSize(width: widthHalf, height: assignHeight))
        
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
        
        let view = arrView[indexPath.row]
        let name = NSStringFromClass(view.classForCoder).replacingOccurrences(of: "BaseBS_CRM.", with: "")
        Logger.info(name)
        Logger.info(DashBoardCell.ticket.rawValue)
        Logger.info("khiemht \(indexPath.row)")
        
        if name == DashBoardCell.ticket.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardTicketCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else if name == DashBoardCell.stats.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardStatsCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else if name == DashBoardCell.open.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardOpenTicketCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else if name == DashBoardCell.traffic.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardTrafficCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else if name == DashBoardCell.assign.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardTicketsAssignCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else if name == DashBoardCell.due.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardDueTicketsCollectionViewCell.identifier, for: indexPath)
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardTicketCollectionViewCell.identifier, for: indexPath)
        //
        return cell
    }

}

extension SaleDashboard: DashboardControllerOutput {
    func addNewWatchItem() {
//        let cell1 = DashboardTicketCollectionViewCell.xibInstance()
//        cell1.frame = CGRect(origin: .zero, size: CGSize(width: widthFull, height: totalHeight))
//        arrView.append(cell1)
//        dashboardLayout?.cache.removeAll()
//
//        collectionView.reloadData()
        vAddItem = UIView(frame: self.bounds)
        vAddItem?.backgroundColor = .clear
        
        let v = ItemAddDashboardView(frame: CGRect(origin: .zero, size: CGSize(width: widthScreen*2/3, height: heightScreen/2)))
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        v.center = vAddItem!.center
        gestureTap.cancelsTouchesInView = false
        
        vAddItem?.addGestureRecognizer(gestureTap)
        vAddItem?.addSubview(v)
        self.addSubview(vAddItem!)
        gestureTap.delegate = self
    }

    
    @objc func dismissView() {
        vAddItem?.removeFromSuperview()
    }
}

extension SaleDashboard: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return false
    }
}


