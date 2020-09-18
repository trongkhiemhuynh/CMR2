//
//  CustomerJourneyView.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class CustomerJourneyView: BaseView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    private func setupView() {
        let vMagic = MagicCollectionView.xibInstance()
        vMagic.frame = CGRect(x: 0, y: 16, width: widthScreen, height: heightScreen - 100)
        vMagic.dictData = ["0":["type":"email","title":"Sent an email","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 5, 2020"],
                           "1":["type":"email","title":"Sent an message","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 6, 2020"],
                           "2":["type":"email","title":"Sent an email","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 7, 2020"],
                           "3":["type":"email","title":"Sent an message quickly","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 8, 2020"],
                           "4":["type":"email","title":"Sent an message quickly","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 8, 2020"],
                           "5":["type":"email","title":"Sent an message quickly","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 8, 2020"],
                           "6":["type":"email","title":"Sent an message quickly","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 8, 2020"]]
        
        vMagic.magicDatasource.type = .customer_journey
        vMagic.controller = UIViewController()
        vMagic.heightDefaultHeader = 0
        vMagic.heightCell = 120
        vMagic.collectionView.registerCell(CustomerJourneyCollectionViewCell.self)
        
//        addBack()
//        let backButton = UIButton(frame: CGRect(x: widthScreen - 50, y: vMagic.frame.size.height - 150, width: 40, height: 40))
//        backButton.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        self.addSubview(vMagic)
    }

}
