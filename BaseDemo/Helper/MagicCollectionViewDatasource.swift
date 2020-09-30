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

class MagicCollectionViewDatasource: NSObject, UICollectionViewDataSource {
    //variable
    public var dictData: Dictionary<String, Any>?
    public var arrCells: [UICollectionViewCell]?
    private var arrData: Array<String>?
    public var type: Magic_View = .setting

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Logger.info(dictData?.keys)
        return dictData?.keys.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if type == .customer_journey {
            return 1
        }
        
        arrData = dictData?[String(section)] as? Array<String>
        
        Logger.info(arrData?.count)
        
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
            var postFix = ""
            if type == .contact_detail {
                postFix = "contact_"
            }
            
            cell.onUpdate(title, postFix)

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
            cell.lblDescription.text = ""
            
            return cell
        } else if type == .extend_task {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailActivityCollectionViewCell.identifier, for: indexPath) as! TicketDetailActivityCollectionViewCell
            
            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            
            cell.onUpdate(item: ExtendModel(title: title, time: "30/9/2020", description: "", imageName: "tasks"))
            
            return cell
        } else if type == .extend_attach {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailActivityCollectionViewCell.identifier, for: indexPath) as! TicketDetailActivityCollectionViewCell
            
            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            
            cell.onUpdate(item: ExtendModel(title: title, time: "30/9/2020", description: "", imageName: "attachments"))
            
            return cell
        } else if type == .extend_event {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailActivityCollectionViewCell.identifier, for: indexPath) as! TicketDetailActivityCollectionViewCell
            
            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            
            cell.onUpdate(item: ExtendModel(title: title, time: "30/9/2020", description: "", imageName: "event"))
            
            return cell
        } else if type == .extend_comment {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailActivityCollectionViewCell.identifier, for: indexPath) as! TicketDetailActivityCollectionViewCell
            
            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            
            cell.onUpdate(item: ExtendModel(title: title, time: "30/9/2020", description: "", imageName: "comments"))
            
            return cell
        } else if type == .extend_chat {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailActivityCollectionViewCell.identifier, for: indexPath) as! TicketDetailActivityCollectionViewCell
            
            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            
            cell.onUpdate(item: ExtendModel(title: title, time: "30/9/2020", description: "", imageName: "chat"))
            
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
        } else if type == .extend_notes {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailActivityCollectionViewCell.identifier, for: indexPath) as! TicketDetailActivityCollectionViewCell
            
            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            cell.lblTitle.text = title
            let imageName = Extend_Type.notes.rawValue.lowercased()
            
            cell.onUpdate(item: ExtendModel(title: title, time: "13/10/2020", description: "", imageName: imageName))
            
            return cell
        } else if type == .logcall {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogCallViewCell.identifier, for: indexPath) as! LogCallViewCell
            cell.lblName.text = arrData![indexPath.row]
            cell.lblCompany.text = arrData![indexPath.row]
            
            return cell
        } else if type == .contact {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogCallViewCell.identifier, for: indexPath) as! LogCallViewCell
            cell.onUpdate()
            return cell
        } else if type == .auto {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailInputInfoCollectionViewCell.identifier, for: indexPath) as! TicketDetailInputInfoCollectionViewCell
            
            let arr = dictData?[String(indexPath.section)] as! Array<String>
            let title = arr[indexPath.row]
            let imageName = title.lowercased().replacingOccurrences(of: " ", with: "_")
            cell.onUpdate(UIImage(named: imageName), title, title)

            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCellID", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if type == .profile {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileCollectionReusableView.identifier, for: indexPath) as! ProfileCollectionReusableView
            
            headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapHeader)))
            
            return headerView
        } else if type == .account || type == .contact_detail {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AccountReusableView.identifier, for: indexPath) as! AccountReusableView
            
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
        print(#function)
        if type == .profile {
            return CGSize(width: widthScreen, height: heightScreen - 170)
        } else {
            return CGSize(width: widthScreen, height: 50)
        }
    }
    
    @objc func onTapHeader() {
        didUpdateProfileView(name: "ProfileHeader")
    }

}

extension MagicCollectionViewDatasource: ProfileCollectionViewCellOutput {
    func didUpdateProfileView(name: String) {
        
        if name == Profile_Item.contact.rawValue {
            RouterManager.shared.handleRouter(AddressRoute())
            return
        }
        
        if name == Profile_Item.logout.rawValue {
            RouterManager.shared.handleRouter(LoginRoute())
            return
        }
        
        if name == "ProfileHeader" {
            RouterManager.shared.handleRouter(AccountRoute())
            return
        }
        
        let topController = UIApplication.getTopViewController()
        let vc = UIViewController()
        let presenter = PresenterView.xibInstance()
        let content = UILabel(frame: presenter.vContent.bounds)
        
        presenter.vTitle.lblTitle.text = name
        presenter.hideAddNewBtn(on: true)
        
        content.text = "Opps!!!"
        content.contentMode = .center
        content.font = UIFont(name: content.font.fontName, size: 30)
        
        presenter.frame = vc.view.bounds
        presenter.vContent.addSubview(content)
        presenter.controller = topController
        
        vc.view.addSubview(presenter)
        presenter.layoutIfNeeded()
        topController?.navigationController?.pushViewController(vc, animated: true)
    }
}

class MagicCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public var itemsPerRow: CGFloat?
    public var heightCell: CGFloat?
    public var collectionView: UICollectionView?
    public var minimumSpacingSection: CGFloat = 10
    public var minimumInterItem: CGFloat = 10
    
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
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let yOffset = collectionView.contentOffset.x
        let yCell = cell.frame.origin.x
        let percent = (yOffset - yCell)/cell.bounds.width
        if percent > 0.5 {
            Logger.info(indexPath.row)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        Logger.info(scrollView.contentOffset.x)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumSpacingSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItem
    }
    
}


//  Outside the implementation block:
//let kNewPageLoadScrollPercentageThreshold: CGFloat = 0.66
//
//func ShouldLoadNextPage(collectionView: UICollectionView) -> Bool {
//    let xOffset = collectionView.contentOffset.x
//    let height = collectionView.contentSize.width - collectionView.frame.width
//
//  return (yOffset / height) > kNewPageLoadScrollPercentageThreshold
//}
