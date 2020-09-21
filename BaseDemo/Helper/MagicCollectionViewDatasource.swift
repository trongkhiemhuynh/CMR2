//
//  MagicCollectionViewDatasource.swift
//  BaseDemo
//
//  Created by macOS on 9/10/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import UIKit

protocol MagicCollectionViewDelegateOutput: class {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

enum MAGIC_VIEW_TYPE {
    case setting
    case profile
    case account
    case contact
    case contact_detail
    case extend
    case customer_journey
    case notes
    case event
}

class MagicCollectionViewDatasource: NSObject, UICollectionViewDataSource {
    //variable
    public var dictData: Dictionary<String, Any>?
    public var arrCells : [UICollectionViewCell]?
    private var arrData : Array<String>?
    public var type : MAGIC_VIEW_TYPE = .setting

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Logger.info(dictData?.keys)
        return dictData?.keys.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if type == .customer_journey {
            return 1
        }
        
        arrData = dictData?[String(section)] as? Array<String>
        
        return arrData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if type == .setting {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MagicCollectionViewCell.identifier, for: indexPath) as! MagicCollectionViewCell
            cell.img.image = UIImage(named: "no_avatar")
            cell.vImg.isHidden = true

            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            
            cell.title.text = title
            cell.icRight.image = UIImage(named: "next")
            return cell
        } else if type == .account || type == .contact_detail {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCollectionViewCell.identifier, for: indexPath) as! AccountCollectionViewCell
            
            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            
            cell.lblTitle.text = title
            cell.lblName.text = title
            
            //check item have picklist
            if arrAccountArrowDown.contains(title) || arrContactArrowDown.contains(title) {
                cell.ivDropdown.isHidden = false
            }
            
            return cell
        } else if type == .profile {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as! ProfileCollectionViewCell
            cell.delegate = self
            return cell
        } else if type == .extend {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailActivityCollectionViewCell.identifier, for: indexPath) as! TicketDetailActivityCollectionViewCell
            
            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            cell.lblTitle.text = title
            cell.lblTime.text = "Thu Sep 17, 14:52"
            cell.lblDescription.isHidden = true
            
            return cell
        } else if type == .customer_journey {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomerJourneyCollectionViewCell.identifier, for: indexPath) as! CustomerJourneyCollectionViewCell
            let dict = dictData?[String(indexPath.section)] as! Dictionary<String, String>
            cell.lblTime.text = dict["time"]
            cell.lblTitle.text = dict["title"]
            cell.lblDescription.text = dict["description"]
            let imageType = dict["type"]
            cell.iv.image = UIImage(named: imageType!)

            
            if indexPath.section == ((dictData?.keys.count)! - 1) {
                cell.line.isHidden = true
            }
            
            return cell
        } else if type == .notes {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailActivityCollectionViewCell.identifier, for: indexPath) as! TicketDetailActivityCollectionViewCell
            
            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            cell.lblTitle.text = title
            cell.iv.image = UIImage(named: "ex_notes")
            cell.lblTime.text = ApplicationManager.sharedInstance.defaultDateFormatter.string(from: Date())
            cell.lblDescription.isHidden = true
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCellID", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if type == .profile {
            let headerView  = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileCollectionReusableView.identifier, for: indexPath) as! ProfileCollectionReusableView
            
            return headerView
        }
        
        let headerView  = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MagicHeaderCollectionReusableView.identifier, for: indexPath) as! MagicHeaderCollectionReusableView
        
        headerView.backgroundColor = BASEColor.BackgroundListColor()
        headerView.lblSection.text = ""
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if type == .profile {
            return CGSize(width: widthScreen, height: heightScreen - 170)
        } else {
            return CGSize(width: widthScreen, height: 50)
        }
    }
}

extension MagicCollectionViewDatasource: ProfileCollectionViewCellOutput {
    func didUpdateProfileView(name: String) {
        UIApplication.getTopViewController()?.showAlert(title: name, message: ALERT_TYPE.undefine.rawValue)
    }
}

class MagicCollectionViewDelegate : NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public var itemsPerRow : CGFloat?
    public var heightCell : CGFloat?
    
    // delegate
    weak var delegate: MagicCollectionViewDelegateOutput?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsetsDefault.left * ((itemsPerRow ?? 1) + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / (itemsPerRow ?? 1)
        
        return CGSize(width: widthPerItem, height: heightCell ?? heightDefaultCell)
    }
}


