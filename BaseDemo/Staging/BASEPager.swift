//
//  BASEPager.swift
//  BaseDemo
//
//  Created by macOS on 9/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class BASEPager: BaseView {

    @IBOutlet weak var pagerControl: UIPageControl!
    
    override func awakeFromNib() {
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    func setupView() {
        Logger.info(self.bounds)
        let v = MagicCollectionView.xibInstance()
        self.addSubview(v)
        
        v.dictData = ["0":["Ho Chi Minh","Ha Noi","Da Nang","Can Tho","Phu Yen"]]
        v.scrollDirection = .horizontal
        v.controller = UIViewController()
        v.heightDefaultHeader = 0.0
        v.collectionView.registerCell(AddressPagerCollectionViewCell.self)
        v.magicDatasource.type = .address_pager
        v.frame = self.bounds
        v.heightCell = self.bounds.height
        v.delegateAddSubView = self
        v.collectionView.backgroundColor = .clear
        
//        v.collectionView.decelerationRate = 0.
//        pagerControl.numberOfPages = 5
//        pagerControl.currentPage = 0
        
    }
}

extension BASEPager: BaseViewOutput {
    func didAddNew() {
        //FIXME detect current pager
    }
}
