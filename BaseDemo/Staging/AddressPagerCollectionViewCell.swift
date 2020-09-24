//
//  AddressPagerCollectionViewCell.swift
//  BaseDemo
//
//  Created by macOS on 9/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class AddressPagerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblDirection: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 12.0
        self.clipsToBounds = true
    }
    
    func onUpdate() {
        lblCompany.text = "CÔNG TY CỔ PHẦN GIẢI PHÁP KINH DOANH NỀN TẢNG (BASEBS)"
        lblAddress.text = "Lầu 18, Tòa Nhà VCCI, 9 Đào Duy Anh, P. Phương Mai,Q. Đống Đa, HN"
        lblDirection.text = "Chỉ đường"
        lblPhone.text = "1900 633 568"
        lblMail.text = "info@basebs.com/marketing@basebs.com"
        lblWebsite.text = "basebs.com"
    }

}

extension AddressPagerCollectionViewCell: XibInitalization {
    typealias Element = AddressPagerCollectionViewCell
}
