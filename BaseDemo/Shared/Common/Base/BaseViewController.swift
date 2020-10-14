//
//  BaseViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol BaseControllerInput: class {
    func showAlertInfo(description: String)
}

class BaseViewController: UIViewController {

    @IBOutlet weak var vTitle: CustomTitleView!
    @IBOutlet weak var vContent: UIView!
    
    //variable
    var isHiddenNavigationBar = true
    weak var controllerOwner : UIViewController?
    weak var delegateInput: BaseControllerInput?
    
    var viewType: MagicViewType!
    
//    public lazy var alertController: UIAlertController = {
//        return UIAlertController()
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = isHiddenNavigationBar
        
        setupView()
        initData()
        initCommon()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = isHiddenNavigationBar
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
