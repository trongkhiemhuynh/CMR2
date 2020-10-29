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
import RealmSwift

protocol DashboardControllerOutput: class {
    func addNewWatchItem()
}

class DashboardController: BaseViewController {
    
    //outlet
    @IBOutlet weak var lblCountNotification : UILabel!
    
    //variable
    let menu = MenuLeft.shared.onMenu()
    var sv: BaseView? = UIView() as? BaseView
    var controller: ReportController?
    var isReport: Bool = false
    
    var menuVC: MenuViewController? {
        let sideMenu = MenuLeft.shared.onMenu()
        let menuController = sideMenu?.viewControllers.first as? MenuViewController
        
        return menuController
    }
    
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
    }
    
    override func initData() {
        super.initData()
        
        var numberCount = "9999"
        
        if Int(numberCount)! > 9 {
            numberCount = "9+"
        }
        
        lblCountNotification.text = numberCount
        
        
        /// subcrible
        
        
        menuVC?._rx_ItemVar.subscribe(onNext: { (menuItem) in
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
        
        sv?.frame = CGRect(origin: .zero, size: CGSize(width: widthScreen, height: heightScreen - heightTabbar - sectionInsetsDefault.left*2))
        
        Logger.info("\(widthScreen) -\(heightScreen)")
        Logger.info(sv?.frame)
    }
    
    @IBAction func actionClick() {

    }
    
    @IBAction func actionDismiss() {
//        popupView.removeFromSuperview()
    }
    
    
    @IBAction func didTapMenu() {
        let menu = MenuLeft.shared.onMenu()
        present(menu!, animated: true, completion: nil)
    }
    
    @IBAction func didTapAlert() {
//        let notiView = NotificationView.xibInstance()
//        generateView(subView: notiView, title: "Notification", actionType: .none)
        isReport = !isReport
        
        if isReport {
            onShowReport()
        } else {
            hideReport()
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
        Logger.info(name)
        guard let vcName = name?.values.first else {return}
        
        //handle for tabbar ticket
//        if vcName == HamburgerMenu.ticket.rawValue {
//            ApplicationManager.sharedInstance.mainTabbar?.customTabbar.switchTab(from: TabMenu.dashboard.rawValue, to: TabMenu.ticket.rawValue)
//        }

        if let keyObj = name?.keys.first {
            //FIXME bypass the first
            if keyObj == "init" {
                return
            }
            
            //flag selected for object
            RealmManager.shared.onUpdateSelectedObject(nameObject: vcName)
            
            onLoading()
            Networking.shared.fetchObjectList(id: keyObj) { (arrData, err) in
                self.onDismissLoading()
                
                if err != nil {
                    self.showAlert(title: "ERROR!", message: NSError.unknownError().localizedDescription)
                } else {
                    
                    var arrResult: Array<String> = []
                    
                    if let arrDat = arrData as? Array<Dictionary<String, String>> {
                        //loop for array objects
                        for item in arrDat {
                            for i in item.keys {
                                if i.lowercased().contains("name") {
                                    arrResult.append(item[i]!)
                                    break
                                }
                            }
                        }
                    } else {
                        
                    }
                    
                    let vMagic = MagicCollectionView.xibInstance()
                    vMagic.collectionView.registerCell(LogCallViewCell.self)
                    vMagic.heightCell = heightDefaultCell
                    vMagic.heightHeader = heightHeaderDefault
                    
                    vMagic.dictData = ["0": arrResult]
                    vMagic.controller = self
                    vMagic.arrObj = arrData as? Array<Dictionary<String, String>>
                    
                    let type: MagicViewType = .object_list
                    let actionType: PresenterActionType = .object_add
                    
                    //check type
                    //                    if (name?.values.first?.lowercased().contains("account"))! {
                    //                        type = .account_list
                    //                        actionType = .add_account
                    //                    } else if (name?.values.first?.lowercased().contains("contact"))! {
                    //                        type = .contact
                    //                        actionType = .add_contact
                    //                    }
                    
                    vMagic.viewType = type
                    
                    self.generateView(subView: vMagic, title: (name?.values.first)! + " list", actionType: actionType)
                }
                
            }
        }
    }
}

extension DashboardController: XibInitalization {
    typealias Element = DashboardController
}

extension DashboardController {
    @IBAction func onAddMore() {
        print("onAddMore")
        if let v = sv as? SaleDashboard {
            v.addNewWatchItem()
        }
    }
    
    public func onShowReport() {
        if let saleView = sv as? SaleDashboard {
            controller = ReportController()

            saleView.vReport.isHidden = false
            self.addChild(controller!)
            saleView.vReport.addSubview(controller!.view)
            controller?.didMove(toParent: self)
        }
    }
    
    public func hideReport() {
        if let saleView = sv as? SaleDashboard {
            controller?.willMove(toParent: nil)
            controller?.removeFromParent()
            controller?.view.removeFromSuperview()
            saleView.vReport.isHidden = true
        }
    }
}

class MenuLeft {
    static let shared = MenuLeft()
    var menu: SideMenuNavigationController?
    let menuVC = MenuViewController()
    
    private init(){}
    
    func onMenu() -> SideMenuNavigationController? {
        
        //        menuVC.controllerOwner = self
        //        controllerOwner = menuVC
        menu = SideMenuNavigationController(rootViewController: menuVC)
        menu?.menuWidth = widthScreen - heightTabbar

        menu?.leftSide = true
        //                menu?.sideMenuDelegate = self
        menu?.setNavigationBarHidden(true, animated: true)
        SideMenuManager.default.leftMenuNavigationController = menu
        //                SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        
        return menu
    }
}

class CustomMenuController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    private func setupView() {
        let menu = MenuLeft.shared.menuVC
        
        addChild(menu)
        view.addSubview(menu.view)
        menu.view.frame = CGRect(origin: .zero, size: CGSize(width: self.view.frame.width - heightTabbar, height: self.view.frame.height))
        //
        menu.didMove(toParent: self)
    }
}
