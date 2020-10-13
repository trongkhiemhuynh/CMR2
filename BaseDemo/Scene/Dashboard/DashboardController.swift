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
import RxSwift

class DashboardController: BaseViewController {
    
    //outlet
    @IBOutlet weak var lblCountNotification : UILabel!
    
    //variable
    var menu : SideMenuNavigationController?
    let disposeBag = DisposeBag()
//    var controllerName : String? {
//        willSet {
////            Logger.debug(controllerName)
//        }
//
//        didSet {
////            Logger.debug(controllerName)
//            didTransitionView(controllerName)
//        }
//    }
    
    lazy var blurView : UIView = {
        let v = UIView(frame: view.frame)
        v.backgroundColor = .black
        v.layer.opacity = 0.4
        
        return v
    }()
    
    override func viewDidLoad() {
        isHiddenNavigationBar = true
        super.viewDidLoad()
        addSubView()
        // Do any additional setup after loading the view.
    }

    override func setupView() {
        lblCountNotification.layer.cornerRadius = lblCountNotification.bounds.height/2
        lblCountNotification.clipsToBounds = true

        self.view.backgroundColor = .white
        let menuVC = MenuViewController()
        menuVC.controllerOwner = self
//        controllerOwner = menuVC
        menu = SideMenuNavigationController(rootViewController: menuVC)
        menu?.leftSide = true
        menu?.sideMenuDelegate = self
        menu?.setNavigationBarHidden(true, animated: true)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
    }
    
    override func initData() {
        super.initData()
        
        var numberCount = "9999"
        
        if Int(numberCount)! > 9 {
            numberCount = "9+"
        }
        
        lblCountNotification.text = numberCount
        
        
        /// subcrible
        let menuVC = menu!.viewControllers.first as! MenuViewController
        
        menuVC._rx_ItemVar.subscribe(onNext: { (menuItem) in
            self.onPushView(menuItem)
        }, onCompleted: {}, onDisposed: {}).disposed(by: disposeBag)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isHiddenNavigationBar = true
        super.viewWillAppear(animated)
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
    
    @IBAction func actionClick() {

    }
    
    @IBAction func actionDismiss() {
//        popupView.removeFromSuperview()
    }
    
    
    @IBAction func didTapMenu() {
        present(menu!, animated: true, completion: nil)
    }
    
    @IBAction func didTapAlert() {
        let notiView = NotificationView.xibInstance()
        notiView.frame = CGRect(x: CGPoint.zero.x, y: CGPoint.zero.y, width: widthScreen, height: heightScreen-heightTabbar)
        
        view.addSubview(notiView)
        
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .transitionCurlUp, animations: {
            print("animated")
            self.view.setNeedsLayout()
        }) { (_) in
            print("did show noti view")
        }
    }

}

extension DashboardController: SideMenuNavigationControllerDelegate {
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        view.addSubview(blurView)
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        blurView.removeFromSuperview()
    }
    
    func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {
        Logger.info(menu)
        
//
//        menuVC?.rx_stringVar.subscribe(onNext: { (item) in
//            Logger.debug(item)
//
//        }, onError: { (error) in
//
//        }, onCompleted: {
//
//        }, onDisposed: {
//
//        }).disposed(by: disposeBag)
        
        

    }
    
    func onPushView(_ name : [String:String]?) {
//        Thread.sleep(forTimeInterval: 0.3)
        Logger.info(name)
        guard let vcName = name?.values.first else {return}
        
        if vcName == HamburgerMenu.account.rawValue {
            
            //FIXME call object view
            if let keyObj = name?.keys.first {
                Networking.shared.fetchObjectList(id: keyObj) { (arr, err) in
                    //                print("success")
                    if err != nil {
                        self.showAlert(title: "ERROR!", message: NSError.unknownError().localizedDescription)
                    } else {
                        let vMagic = MagicCollectionView.xibInstance()
                        vMagic.collectionView.registerCell(LogCallViewCell.self)
                        vMagic.heightCell = heightDefaultCell
                        vMagic.heightHeader = heightHeaderDefault
                        
                        vMagic.dictData = ["0":arr!]
                        vMagic.controller = self
                        vMagic.viewType = .account_list
                        //config
                        self.generateView(subView: vMagic, title: "Account list", actionType: .add)
                    }
                    
                }
            }
        } else if vcName == HamburgerMenu.contact.rawValue {
            RouterManager.shared.handleRouter(ContactRoute())
        } else if vcName == HamburgerMenu.ticket.rawValue {
            ApplicationManager.sharedInstance.mainTabbar?.customTabbar.switchTab(from: TabMenu.dashboard.rawValue, to: TabMenu.ticket.rawValue)
        }
    }
}

extension DashboardController : XibInitalization {
    typealias Element = DashboardController
}
