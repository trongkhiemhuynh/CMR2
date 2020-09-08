//
//  DashboardViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import Charts
import SideMenu

class DashboardController: BaseViewController {
    
    var menu : SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func setupView() {
        self.view.backgroundColor = BASEColor.BackgroundListColor()

        menu = SideMenuNavigationController(rootViewController: MenuCollectionViewController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: true)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if view.subviews.count == 2 {
            addSubView()            
        }
    }
    
    func addSubView() {
        let modeLeo = Bundle.main.loadNibNamed("CustomDashboard", owner: self, options: nil)?.last as? CustomDashLion
        Logger.info("\(widthScreen) -\(heightScreen)")
        modeLeo?.frame = CGRect(x: 0, y: 0, width: widthScreen, height: heightScreen)
        view.addSubview(modeLeo!)
        
        modeLeo?.addBartChartView()
        modeLeo?.addPieChartView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
    @IBAction func actionClick() {

    }
    
    @IBAction func actionDismiss() {
//        popupView.removeFromSuperview()
    }
    
    
    @IBAction func tapMenu() {
        print(#function)
        present(menu!, animated: true, completion: nil)
    }
    
    @IBAction func tapAlert() {
        print(#function)
    }

}
