//
//  BaseViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var vTitle : CustomTitleView!
    
    //variable
    var isHiddenNavigationBar = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = isHiddenNavigationBar
        
        setupView()
        initData()
        initCommon()
        // Do any additional setup after loading the view.
    }

    func setupView() {}
    
    func initData() {}
    
    deinit {
        Logger.info("deinit")
    }
}

extension BaseViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}

extension BaseViewController : BaseAbility {
    func initCommon() {
        
    }
    
    func initUIs() {
        
    }
    
    func initBinding() {
        
    }
    
    func initActions() {
        
    }
}
