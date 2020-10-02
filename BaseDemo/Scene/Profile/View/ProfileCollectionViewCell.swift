//
//  ProfileCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 9/11/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol ProfileCollectionViewCellOutput: class {
    func didUpdateProfileView(name: String)
}

enum Profile_Item: String {
    case setting = "Setting"
    case share = "Share account"
    case privacy = "Privacy"
    case question = "Questions"
    case contact = "Contact"
    case logout = "Log out"
    case profileHeader = "PHeader"
}

class ProfileCollectionViewCell: UICollectionViewCell {

    //outlet
    @IBOutlet weak var vSection1: UIView!
    @IBOutlet weak var vSection2: UIView!
    @IBOutlet weak var vSection3: UIView!
    
    @IBOutlet weak var lblSetting: UILabel!
    @IBOutlet weak var lblShare: UILabel!
    @IBOutlet weak var lblPrivacy: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    @IBOutlet weak var lblLogout: UILabel!
    
    //outlet
    weak var delegate: ProfileCollectionViewCellOutput?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = BASEColor.BackgroundListColor()
        
        vSection1.layer.cornerRadius = cornerRadius
        vSection2.layer.cornerRadius = cornerRadius
        vSection3.layer.cornerRadius = cornerRadius
        vSection1.clipsToBounds = true
        vSection2.clipsToBounds = true
        vSection3.clipsToBounds = true
        
        addInteraction([lblSetting,lblQuestion,lblPrivacy,lblShare,lblContact,lblLogout])
    }
    
    @objc func onTap(_ gesture: UITapGestureRecognizer) {
        print(#function)
        didTap(gesture)
    }
    
    @objc func didTap(_ gesture: UITapGestureRecognizer) {
        print(#function)
        if let v = gesture.view as? UILabel {
            switch v.text! {
            case Profile_Item.setting.rawValue:
                delegate?.didUpdateProfileView(name: Profile_Item.setting.rawValue)
            case Profile_Item.share.rawValue:
                delegate?.didUpdateProfileView(name: Profile_Item.share.rawValue)
            case Profile_Item.privacy.rawValue:
                delegate?.didUpdateProfileView(name: Profile_Item.privacy.rawValue)
            case Profile_Item.question.rawValue:
                delegate?.didUpdateProfileView(name: Profile_Item.question.rawValue)
            case Profile_Item.contact.rawValue:
                delegate?.didUpdateProfileView(name: Profile_Item.contact.rawValue)
            case Profile_Item.logout.rawValue:
                delegate?.didUpdateProfileView(name: Profile_Item.logout.rawValue)
            default:
                delegate?.didUpdateProfileView(name: "Opps!")
            }
        }
    }
    
    private func addInteraction(_ arrItem: Array<UILabel>) {
        var index = 0
        for item in arrItem {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
            
            item.tag = index
            item.isUserInteractionEnabled = true
            item.addGestureRecognizer(tapGesture)
            index += 1
        }
    }
    
    func onUpdate() {
        vSection1.dropShadow(color: .lightGray)
        vSection2.dropShadow(color: .lightGray)
        vSection3.dropShadow(color: .lightGray)
    }

}

extension ProfileCollectionViewCell : XibInitalization {
    typealias Element = ProfileCollectionViewCell
}
