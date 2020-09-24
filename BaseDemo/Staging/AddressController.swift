//
//  CustomTabbar.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import CoreLocation

//protocol AddressControllerOutput: class {
//    func changeLocation(_ location: CLLocation?)
//}

let BASEBS_HN_LOCATION = CLLocation(latitude: 21.0086301, longitude: 105.8376027)

class AddressController: BaseViewController {
    
    @IBOutlet weak var vPager: BASEPager!
    @IBOutlet weak var vMap: MapView!
    
//    weak var delegate: AddressControllerOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupView() {
        vTitle.btnFilter.isHidden = true
        vTitle.btnSearch.isHidden = true
        vTitle.lblTitle.text = "Contact"
        
        vPager.delegateAddSubView = self
        vPager.controller = self
        vMap.controller = self
    }
    
    @IBAction func onBack() {
        didPopView()
    }
}

extension AddressController: XibInitalization {
    typealias Element = AddressController
}

extension AddressController: BaseViewOutput {
    func didAddNew() {
        //change pager view
//        delegate?.changeLocation(BASEBS_HN_LOCATION)
        vMap.onUpdateLocation(BASEBS_HN_LOCATION)
    }
}
