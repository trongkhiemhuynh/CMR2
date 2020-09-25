//
//  LogCallViewCell.swift
//  BaseDemo
//
//  Created by macOS on 9/23/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class LogCallViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var ivStatus: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func onUpdate() {
        lblName.text = "Bill Gates"
        lblCompany.text = "Microsoft"
        ivAvatar.image = UIImage(named: "no_avatar")
        ivStatus.isHidden = true
    }

}

extension LogCallViewCell: XibInitalization {
    typealias Element = LogCallViewCell
}
