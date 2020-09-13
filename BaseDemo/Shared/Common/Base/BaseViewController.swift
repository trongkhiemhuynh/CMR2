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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        setupView()
        initData()
        initCommon()
        // Do any additional setup after loading the view.
    }
    

    func setupView() {}
    
    func initData() {}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
