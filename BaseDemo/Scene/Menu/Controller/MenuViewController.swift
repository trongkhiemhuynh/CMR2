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

    @IBOutlet weak var collectionView : UICollectionView!
    
    var itemVar : String {
        get {
            return _rx_ItemVar.value
        }
        
        set {
            Logger.info(newValue)
            _rx_ItemVar.accept(newValue)
        }
    }
    
    var arrMenu: Array<Any> = []
    
    var _rx_ItemVar = BehaviorRelay<String>(value: HamburgerMenu.dashboard.rawValue)
    
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
        // Do any additional setup after loading the view.
        
    }
    
    override func initData() {
        Networking.shared.fetchMenu { (data, response, error) in
            if let d = data {
                if let json = try? JSONSerialization.jsonObject(with: d, options: []) as? [String: Any] {
                    if let dict = json["data"] as? [String: Any] {
                        let arrKeys = dict.keys
                        
                        for key in arrKeys {
                            let value = dict[key]
                            if let val = value as? String {
                                self.arrMenu.append(val)
                            }
                            
                            self.collectionView.reloadData()
                        }
                    }
                    
                }
            }
        }
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailInfoCollectionViewCell.identifier, for: indexPath) as! TicketDetailInfoCollectionViewCell
            // Configure the cell
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
            let item = arrMenu[indexPath.row] as! String
            
            let nameImage = "menu_\(item.lowercased().replacingOccurrences(of: " ", with: "_"))"
            let image = UIImage(named: nameImage)
            
            cell.imgMenu.image = image
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
        let nameItem = arrMenu[indexPath.row]
//        Logger.debug(nameItem)
        Logger.info(nameItem)
        
        
        
        SideMenuManager.default.leftMenuNavigationController?.dismiss(animated: true, completion: {
//            self.menuSelectedItem.accept(nameItem)
//            self.stringVar = nameItem
//            let dashboardVC = self.controllerOwner as? DashboardController
//            dashboardVC?.controllerName = nameItem
            
            self.itemVar = nameItem as! String
        })
    }
}
