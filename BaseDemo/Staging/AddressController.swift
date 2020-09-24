//
//  CustomTabbar.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class AddressController: BaseViewController {
    
    @IBOutlet weak var vPager: BASEPager!
    @IBOutlet weak var vMap: MapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AddressController: XibInitalization {
    typealias Element = AddressController
}
