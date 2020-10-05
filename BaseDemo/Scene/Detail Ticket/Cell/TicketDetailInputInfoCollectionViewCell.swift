//
//  AssignTicketViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol TicketDetailInputInfoCollectionViewCellOutput: class {
    func didEndEdit(titleField: String, inputField : String)
    func onFrameCell(_ cell: UICollectionViewCell)
}

class TicketDetailInputInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iv:UIImageView!
    @IBOutlet weak var lbl : UILabel!
    @IBOutlet weak var tf : UITextField!
    
    //delegate
    weak var delegate : TicketDetailInputInfoCollectionViewCellOutput?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 30))
        tf.leftView = paddingView
        tf.leftViewMode = .always
    }
    
    public func onUpdate( image: UIImage?, title: String?, detail: String?) {
        iv.image = image
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

extension TicketDetailInputInfoCollectionViewCell : XibInitalization {
    typealias Element = TicketDetailInputInfoCollectionViewCell
    
    
}

extension TicketDetailInputInfoCollectionViewCell : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.onFrameCell(self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        Logger.debug(textField.text!)
        delegate?.didEndEdit(titleField: lbl.text!, inputField: tf.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Logger.debug(textField.text!)
        delegate?.didEndEdit(titleField: lbl.text!, inputField: tf.text!)
        return true
    }
}
