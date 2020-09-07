//
//  DashboardViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import Charts

class DashboardController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func setupView() {
        self.view.backgroundColor = BASEColor.BackgroundListColor()
   
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if view.subviews.count == 0 {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
