//
//  TicketDetailInfoCollectionViewCell.swift
//  BaseDemo
//
//  Created by BASEBS on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TicketDetailInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var iv: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let loginObj = RealmManager.shared.onGetLoginObject() as? LoginObject
        
        lblName.text = loginObj?.name
        lblJob.text = loginObj?.tenant
        lblID.text = "ID: " + (loginObj?.tenant ?? "")
        
        iv.layer.cornerRadius = iv.frame.size.height/2
        iv.clipsToBounds = true
    }

    override func layoutSubviews() {
        if let imgData = ApplicationManager.sharedInstance.getValueUserDefault(key: kAvatarImage) as? Data {
            iv.image = UIImage(data: imgData)
        }
    }
}

extension TicketDetailInfoCollectionViewCell: XibInitalization {
    typealias Element = TicketDetailInfoCollectionViewCell
}
