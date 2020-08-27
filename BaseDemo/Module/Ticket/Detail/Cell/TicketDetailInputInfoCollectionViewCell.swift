//
//  AssignTicketViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TicketDetailInputInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iv : UIImageView!
    @IBOutlet weak var lbl : UILabel!
    @IBOutlet weak var tf : UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        tf.leftView = paddingView
        tf.leftViewMode = .always
    }
    
    public func reloadData(_ im : UIImage?,_ title : String?,_ detail : String?) {
        iv.image = im
        lbl.text = title
        tf.text = detail
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
