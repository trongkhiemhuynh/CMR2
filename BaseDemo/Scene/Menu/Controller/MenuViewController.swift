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

    private let itemsPerRow: CGFloat = 1
    private let heightCellInfo : CGFloat = 100
    private let heightCellInfoDetail : CGFloat = 50
    
    var itemVar : String {
        get {
            return _rx_ItemVar.value
        }
        
        set {
            _rx_ItemVar.accept(newValue)
        }
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    

    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension MenuViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrMenuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailInfoCollectionViewCell.identifier, for: indexPath) as! TicketDetailInfoCollectionViewCell
            // Configure the cell
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
            let item = arrMenuItems[indexPath.row]
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
            return CGSize(width: widthPerItem, height: heightCellInfo)
        } else {
            return CGSize(width: widthPerItem, height: heightCellInfoDetail)
        }
    }
}

extension MenuViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        ApplicationManager.sharedInstance.itemMenuSelected = ItemMenu[indexPath.row]
        
        let nameItem = arrMenuItems[indexPath.row]
//        Logger.debug(nameItem)
        
        self.itemVar = nameItem
        
        SideMenuManager.default.leftMenuNavigationController?.dismiss(animated: true, completion: {
//            self.menuSelectedItem.accept(nameItem)
//            self.stringVar = nameItem
//            let dashboardVC = self.controllerOwner as? DashboardController
//            dashboardVC?.controllerName = nameItem
            
            
        })
    }
}
