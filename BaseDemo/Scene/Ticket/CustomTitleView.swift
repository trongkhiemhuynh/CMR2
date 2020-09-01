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
        
        let vFilter = Bundle.main.loadNibNamed("FilterView", owner: self, options: nil)?.first as? FilterView
        
        guard let v = vFilter else {return}
        superview?.addSubview(v)
        v.frame = superview!.bounds
    }

    @IBAction func actionSearch(_ sender: UIButton) {
        vSearch.isHidden = !vSearch.isHidden
        
        if vSearch.isHidden {
            endEditing(true)
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
//        vContent.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        vSearch.isHidden = true

        tfSearch.placeholder = "Search ..."
        
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        print("---khiemht",#line,#function)
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
        print(textField.text)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text)
        
        return true
    }
}
