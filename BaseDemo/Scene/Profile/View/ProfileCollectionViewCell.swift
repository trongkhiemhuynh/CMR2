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

class ProfileCollectionViewCell: UICollectionViewCell {

    //outlet
    @IBOutlet weak var vSetting: UIView!
    @IBOutlet weak var vShare: UIView!
    @IBOutlet weak var vPrivacy: UIView!
    @IBOutlet weak var vQuestion: UIView!
    @IBOutlet weak var vContact: UIView!
    @IBOutlet weak var vLogout: UIView!
    
    //outlet
    weak var delegate: ProfileCollectionViewCellOutput?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = BASEColor.BackgroundListColor()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap(gesture:)))
        tapGesture.cancelsTouchesInView = false
        vSetting.tag = 1
        vShare.tag = 2
        vPrivacy.tag = 3
        vQuestion.tag = 4
        vContact.tag = 5
        vLogout.tag = 6

        vSetting.addGestureRecognizer(tapGesture)
        vShare.addGestureRecognizer(tapGesture)
        vPrivacy.addGestureRecognizer(tapGesture)
        vQuestion.addGestureRecognizer(tapGesture)
        vContact.addGestureRecognizer(tapGesture)
        vLogout.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTap(gesture: UITapGestureRecognizer) {
        if let v = gesture.view {
            switch v.tag {
            case 1:
                delegate?.didUpdateProfileView(name: "Setting")
            case 2:
                delegate?.didUpdateProfileView(name: "Share")
            case 3:
                delegate?.didUpdateProfileView(name: "Privacy")
            case 4:
                delegate?.didUpdateProfileView(name: "Question")
            case 5:
                delegate?.didUpdateProfileView(name: "Contact")
            case 6:
                delegate?.didUpdateProfileView(name: "Log out")
            default:
                delegate?.didUpdateProfileView(name: "Undefine")
            }
        }
        
    }

}

extension ProfileCollectionViewCell : XibInitalization {
    typealias Element = ProfileCollectionViewCell
}
