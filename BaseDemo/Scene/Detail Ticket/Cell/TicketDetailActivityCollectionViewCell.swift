//
//  TicketDetailActivityCollectionViewCell.swift
//  BaseDemo
//
//  Created by BASEBS on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

struct ExtendModel {
    let title: String?
    let time: String?
    let description: String?
    let imageName: String?
}

class TicketDetailActivityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var vContent: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var iv: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        vContent.layer.cornerRadius = corner8Radius
    }
    
    func onUpdate(item: ExtendModel) {
        lblTitle.text = item.title
        lblTime.text = item.title
        lblDescription.text = item.description
        iv.image = UIImage(named: item.imageName!)
    }

}

extension TicketDetailActivityCollectionViewCell : XibInitalization {
    typealias Element = TicketDetailActivityCollectionViewCell
}
