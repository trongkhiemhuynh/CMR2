//
//  CustomDashboard.swift
//  BaseDemo
//
//  Created by macOS on 8/27/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class SaleDashboard: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var v3 : UIView!
    @IBOutlet weak var v4 : UIView!
    
    @IBOutlet weak var v1 : UIView!
    @IBOutlet weak var v2 : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.translatesAutoresizingMaskIntoConstraints = false
        print("---",frame, #function, NSStringFromClass(self.classForCoder))
    }
    
    @objc func handleTapped( gesture : UITapGestureRecognizer){
        print("tapped !!!")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("-------",#function,String(describing: self))
        
        setupView()
    }
    
    func setupView(){
         v1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTapped(gesture:))))
    }
}

extension SaleDashboard : XibInitalization {
    typealias Element = SaleDashboard
}
