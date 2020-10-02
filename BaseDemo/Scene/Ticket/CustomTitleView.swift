//
//  TopTitleView.swift
//  BaseDemo
//
//  Created by BASEBS on 8/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomTitleView: BaseView {

    @IBOutlet weak var lblTitle : UILabel!
    
    @IBOutlet weak var btnSearch : UIButton!
    
    @IBOutlet weak var btnFilter : UIButton!
    
    @IBOutlet weak var tfSearch : UITextField!
    
    @IBOutlet weak var vSearch : UIView!
    
    @IBAction func actionFilter(_ sender: UIButton) {
        let vFilter = FilterView.xibInstance()
        superview?.addSubview(vFilter)
        vFilter.frame = superview!.bounds
    }

    @IBAction func actionSearch(_ sender: UIButton) {
        vSearch.isHidden = !vSearch.isHidden
        
        if vSearch.isHidden {
            endEditing(true)
        } else {
            endEditing(false)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomTitleView", owner: self, options: nil)
        addSubview(vContent)
        vContent.frame = self.bounds
        
        vSearch.isHidden = true
        tfSearch.placeholder = "Search ..."
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onDismissKeyboard))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension CustomTitleView : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        Logger.debug(textField.text!)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        Logger.debug(textField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Logger.debug(textField.text!)
        
        return true
    }
}
