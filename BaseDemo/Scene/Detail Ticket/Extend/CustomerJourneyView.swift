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
        let presenter = getPresenterView(title: Extend_Type.activities.rawValue, isAddNew: false)
        presenter.vContent.addSubview(vMagic)
        self.addSubview(presenter)
        
        vMagic.frame = presenter.vContent.bounds
        vMagic.dictData = ["0":["type":"email_closed_dark","title":"Sent an email","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 5, 2020"],
                           "1":["type":"email_closed_dark","title":"Sent an message","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 6, 2020"],
                           "2":["type":"chat_closed","title":"Sent an email","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 7, 2020"],
                           "3":["type":"email_closed_dark","title":"Sent an message quickly","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 8, 2020"],
                           "4":["type":"chat_closed","title":"Sent an message quickly","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 8, 2020"],
                           "5":["type":"email_closed_dark","title":"Sent an message quickly","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 8, 2020"],
                           "6":["type":"chat_closed","title":"Sent an message quickly","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","time":"Oct 8, 2020"]]
        
        vMagic.viewType = .customer_journey
        vMagic.heightHeader = heightHeaderDefault
        vMagic.heightCell = heightHeaderProfile
        vMagic.collectionView.registerCell(CustomerJourneyCollectionViewCell.self)
    }

}
