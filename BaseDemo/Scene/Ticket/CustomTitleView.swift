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
    
    @IBAction func actionFilter(_ sender: UIButton) {
        
    }

    @IBAction func actionSearch(_ sender: UIButton) {
        
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
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
