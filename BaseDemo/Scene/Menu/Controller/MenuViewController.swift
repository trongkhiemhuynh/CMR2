//
//  MenuCollectionViewController.swift
//  BaseDemo
//
//  Created by macOS on 9/8/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import SideMenu
import RxSwift
import RxCocoa

private let reuseIdentifier = "Cell"

class MenuViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemVar: [String:String] {
        get {
            return _rx_ItemVar.value
        }
        
        set {
            Logger.info(newValue)
            _rx_ItemVar.accept(newValue)
        }
    }
    
    var arrMenu: Array<Any> = []
    
    var _rx_ItemVar = BehaviorRelay<[String:String]>(value: ["init":HamburgerMenu.dashboard.rawValue])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //let flowLayout = UICollectionViewFlowLayout()
        //flowLayout.scrollDirection = .horizontal

        //collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)

        self.collectionView.registerCell(MenuCollectionViewCell.self)
        self.collectionView.registerCell(TicketDetailInfoCollectionViewCell.self)

        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.headerReferenceSize = CGSize(width: 100, height: 20)
        }
        
    }
    
    override func initData() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        onLoading()
        //FIXME memory check
        Networking.shared.fetchMenu { (arrData, err) in
            self.onDismissLoading()
            if err != nil {
                
            } else {
                self.arrMenu.removeAll()
                var arrResult = arrData
                
                arrResult?.sort(by: { (x, y) -> Bool in
                    let x1 = x as! Dictionary<String, String>
                    let y1 = y as! Dictionary<String, String>
                    
                    return x1.values.first! < y1.values.first!
                })
                
//                arrResult?.sort(by: { (a: [String: String], b:[String: String]) -> Bool in
//                    return a.values.first! > b.values.first!
////                    return self.equals(a.values.first!, a.values.first!)
//                    } as! (Any, Any) -> Bool)
                
                self.arrMenu = arrResult!
                self.collectionView.reloadData()
            }
        }
    }
    
    func equals(_ x : Any, _ y : Any) -> Bool {
        guard x is AnyHashable else { return false }
        guard y is AnyHashable else { return false }
        return (x as! AnyHashable) == (y as! AnyHashable)
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrMenu.count + 1 // for top cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailInfoCollectionViewCell.identifier, for: indexPath) as! TicketDetailInfoCollectionViewCell
            // Configure the cell
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
            let dict = arrMenu[indexPath.row - 1] as! [String:String]
            let item = dict.values.first!
            
            let nameImage = "menu_\(item.lowercased().replacingOccurrences(of: " ", with: "_"))"
            let image = UIImage(named: nameImage)
            
            cell.imgMenu.image = image ?? UIImage(named: "menu_account")
            cell.lblMenu.text = item
            // Configure the cell
            
            return cell
        }
    }
}

extension MenuViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        if indexPath.row == 0 {
            return CGSize(width: widthPerItem, height: heightHeaderDetailTicket)
        } else {
            return CGSize(width: widthPerItem, height: heightDefaultCell)
        }
    }
}

extension MenuViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        ApplicationManager.sharedInstance.itemMenuSelected = ItemMenu[indexPath.row]
        
        if indexPath.row == 0 {
            return
        }
        
        let nameItem = arrMenu[indexPath.row - 1]
//        Logger.debug(nameItem)
        Logger.info(nameItem)
        
        //FIXME reset to home controller
        ApplicationManager.sharedInstance.mainTabbar?.selectedIndex = 0
        let currentPosition = ApplicationManager.sharedInstance.mainTabbar?.customTabbar.activeItem
        let nextPostion = 0
        ApplicationManager.sharedInstance.mainTabbar?.customTabbar.switchTab(from: currentPosition!, to: nextPostion)
        self.itemVar = nameItem as! [String:String]
        SideMenuManager.default.leftMenuNavigationController?.dismiss(animated: true, completion: {
//            self.menuSelectedItem.accept(nameItem)
//            self.stringVar = nameItem
//            let dashboardVC = self.controllerOwner as? DashboardController
//            dashboardVC?.controllerName = nameItem
            
            
        })
    }
}
