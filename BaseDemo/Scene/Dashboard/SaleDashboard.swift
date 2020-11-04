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
    case article = "DashboardNewlyCreatedArticlesCollectionViewCell"
    case activeUser = "DashboardActiveUsersCollectionViewCell"
}

class SaleDashboard: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var vReport: UIView!
    @IBOutlet weak var btnCollapse: UIButton!
    @IBOutlet weak var ctHeightInfo: NSLayoutConstraint!
    @IBOutlet weak var svInfo: UIStackView!
    @IBOutlet weak var ctHeightCollapse: NSLayoutConstraint!
    @IBOutlet weak var ctStackViewTop: NSLayoutConstraint!
    @IBOutlet weak var vW: UIView!
    @IBOutlet weak var vM: UIView!
    @IBOutlet weak var lblM: UILabel!
    @IBOutlet weak var lblW: UILabel!
    @IBOutlet weak var vLineW: UIView!
    @IBOutlet weak var vLineM: UIView!
    
    //properties
    var arrView: [UIView] = []
    let widthFull = widthScreen - sectionInsetsDefault.left*2
    let widthHalf = widthScreen/2 - sectionInsetsDefault.left*2
    private var dashboardLayout: DashboardLayout?
    private var vAddItem: UIView?
    public var isReportView = false
    private var isCollapse = false
    
    fileprivate func setupLayout() {
        iv.layer.cornerRadius = iv.bounds.height/2
        
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
        collectionView.registerCell(DashboardActiveUsersCollectionViewCell.self)
        collectionView.registerCell(DashboardNewlyCreatedArticlesCollectionViewCell.self)
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
        
        let tapGestureM = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        let tapGestureW = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        
        self.vM.addGestureRecognizer(tapGestureM)
        self.vW.addGestureRecognizer(tapGestureW)
        
        //init text color for section
        lblW.textColor = Color.TextTitleColor
        vLineW.backgroundColor = Color.TextTitleColor
        
        lblM.textColor = Color.MainAppColor()
        vLineM.backgroundColor = Color.MainAppColor()
    }
    
    @objc func tapped(sender: UIGestureRecognizer) {
        
        let vLoading = UIView(frame: CGRect(origin: .zero, size: CGSize(width: widthScreen, height: heightScreen)))
        let indicator = UIActivityIndicatorView(style: .gray)
        
        vLoading.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
//        indicator.center = vLoading.center
        let widthSize: CGFloat = 50.0
    
        indicator.frame = CGRect(origin: CGPoint(x: (widthScreen - widthSize)/2, y: (heightScreen - widthSize)/2), size: CGSize(width: widthSize, height: widthSize))
//        indicator.frame.size = CGSize(width: 50, height: 50)
        indicator.startAnimating()
        vLoading.addSubview(indicator)
        
        let rootController = UIApplication.shared.keyWindow?.rootViewController
        Logger.info(rootController?.nibName)
        rootController?.view.addSubview(vLoading)
        
        let v = sender.view!
        
        if v == self.vW {
            lblW.textColor = Color.MainAppColor()
            vLineW.backgroundColor = Color.MainAppColor()
            
            lblM.textColor = Color.TextTitleColor
            vLineM.backgroundColor = Color.TextTitleColor
        } else {
            lblW.textColor = Color.TextTitleColor
            vLineW.backgroundColor = Color.TextTitleColor
            
            lblM.textColor = Color.MainAppColor()
            vLineM.backgroundColor = Color.MainAppColor()
        }
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            timer.invalidate()
            vLoading.removeFromSuperview()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.translatesAutoresizingMaskIntoConstraints = false
        print("---",frame, #function, NSStringFromClass(self.classForCoder))
        
        setupLayout()
    }
    
    @objc func handleTapped( gesture : UITapGestureRecognizer){
        print("tapped !!!")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("-------",#function,String(describing: self))
    }
    
    // collapse icon change
    // animation height constraint
    // hide info view
    @IBAction func onCollapse() {
        isCollapse = !isCollapse
        UIView.animate(withDuration: delayTime) {
            
            self.iv.isHidden = self.isCollapse
            self.svInfo.isHidden = self.isCollapse
            
            if self.isCollapse {
                self.btnCollapse.setImage(UIImage(named: "ic_expand"), for: .normal)
                self.ctHeightInfo.constant = 60.0
                self.ctHeightCollapse.constant = 50.0
                self.ctStackViewTop.constant = 90.0
            } else {
                self.btnCollapse.setImage(UIImage(named: "ic_collapse"), for: .normal)
                self.ctHeightInfo.constant = 170.0
                self.ctHeightCollapse.constant = 160.0
                self.ctStackViewTop.constant = 200.0
                
            }
        }
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
        } else if name == DashBoardCell.activeUser.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardActiveUsersCollectionViewCell.identifier, for: indexPath)
            
            return cell
        } else if name == DashBoardCell.article.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardNewlyCreatedArticlesCollectionViewCell.identifier, for: indexPath)
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardTicketCollectionViewCell.identifier, for: indexPath)
        //
        return cell
    }

}

extension SaleDashboard: DashboardControllerOutput {
    func addNewWatchItem() {
        vAddItem = UIView(frame: self.bounds)
        vAddItem?.backgroundColor = UIColor.init(white: 0.0, alpha: 0.2)

        let v = ItemAddDashboardView(frame: CGRect(origin: .zero, size: CGSize(width: widthScreen - 60, height: 200)))
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        v.center = vAddItem!.center
        gestureTap.cancelsTouchesInView = false

        vAddItem?.addGestureRecognizer(gestureTap)
    
        vAddItem?.addSubview(v)
        self.addSubview(vAddItem!)
        gestureTap.delegate = self
        v.delegate = self
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

extension SaleDashboard: ItemAddDashboardViewDelegate {
    func onFinishSelectedItem(name: String) {
        dismissView()
        onAdd(name)
    }
    
    private func onAdd(_ name: String) {
        switch name {
        case DashboardItemAdded.active_user.rawValue:
            let cell7 = DashboardActiveUsersCollectionViewCell.xibInstance()
            cell7.frame = CGRect(origin: .zero, size: CGSize(width: widthFull, height: totalHeight))
            arrView.append(cell7)
            
            break
        case DashboardItemAdded.newly_article.rawValue:
            let cell8 = DashboardNewlyCreatedArticlesCollectionViewCell.xibInstance()
            cell8.frame = CGRect(origin: .zero, size: CGSize(width: widthFull, height: totalHeight))
            arrView.append(cell8)
            break
        default:
            print("Think out of the box")
        }
        
        dashboardLayout?.cache.removeAll()
        
        collectionView.reloadData()
    }
}

