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
    
    @IBOutlet weak var vContent : UIView!
    @IBOutlet weak var lblCountNotification : UILabel!
    
    var menu : SideMenuNavigationController?
    
    lazy var blurView : UIView = {
        let v = UIView(frame: view.frame)
        v.backgroundColor = .black
        v.layer.opacity = 0.4
        
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        // Do any additional setup after loading the view.
    }


    override func setupView() {
        lblCountNotification.layer.cornerRadius = lblCountNotification.bounds.height/2
        lblCountNotification.clipsToBounds = true
        lblCountNotification.text = "999"

        self.view.backgroundColor = .white

        menu = SideMenuNavigationController(rootViewController: MenuViewController())
        menu?.leftSide = true
        menu?.sideMenuDelegate = self
        menu?.setNavigationBarHidden(true, animated: true)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    func addSubView() {
        var sv: BaseView? = UIView() as? BaseView
        
        let type = ApplicationManager.sharedInstance.templateDashboard
        
        switch type {
        case .manager:
            sv = ManagerDashboard.xibInstance()
            
            sv?.controller = self
            sv?.addBarChart()
            sv?.addPieChart()
        case .sale:
            Logger.info("sale")
            sv = SaleDashboard.xibInstance()
        case .agent:
            Logger.info("agent")
//        default:
//            Logger.info("default")
        }

        vContent.addSubview(sv!)
        
        sv?.frame = vContent.bounds
        
        Logger.info("\(widthScreen) -\(heightScreen)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
    @IBAction func actionClick() {

    }
    
    @IBAction func actionDismiss() {
//        popupView.removeFromSuperview()
    }
    
    
    @IBAction func didTapMenu() {
        print(#function)
        present(menu!, animated: true, completion: nil)
    }
    
    @IBAction func didTapAlert() {
        print(#function)
        let notiView = NotificationView.xibInstance()
        notiView.frame = CGRect(x: 0, y: 0, width: widthScreen, height: heightScreen-70)
        
        view.addSubview(notiView)
        
        UIView.animateKeyframes(withDuration: 0.35, delay: 0.1, options: .allowUserInteraction, animations: {
            self.view.layoutIfNeeded()
        }) { (success) in
            Logger.info(notiView)
        }
    }

}

extension DashboardController : SideMenuNavigationControllerDelegate {
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        view.addSubview(blurView)
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        blurView.removeFromSuperview()
    }
    
    func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {
        
        print("SideMenu Disappeared! (animated: \(animated))")
        
//        let menuLeft = menu.popToRootViewController(animated: false) as? MenuViewController
//
//        if let mn = menuLeft {
//
//            Logger.info(mn.itemSeleted)
//        }

        
        
        if let tabbarController = ApplicationManager.sharedInstance.mainTabbar {
            let nav = tabbarController.viewControllers?[0] as? UINavigationController
            
            let itemMenu = ApplicationManager.sharedInstance.itemMenuSelected
            
            switch itemMenu {
            case .ticket:
                nav?.pushViewController(TicketController(), animated: true)
            default:
                print("hello")
            }
            
            ApplicationManager.sharedInstance.itemMenuSelected = ItemMenu.none
        }
//        RouterManager.shared.handleRouter(TicketRoute())
    }
}

extension DashboardController : XibInitalization {
    typealias Element = DashboardController
}
