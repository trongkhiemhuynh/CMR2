//
//  TicketDetailController.swift
//  BaseDemo
//
//  Created by khiemht on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TicketDetailController: BaseViewController {

    //outlet
    @IBOutlet weak var vAction : CustomDetailActionView!
    @IBOutlet weak var vTab : CustomDetailTabView!
    @IBOutlet weak var vInfo : UIView!
    
    //variable
    private lazy var infoVC: TicketDetailInfoViewController = {
        return TicketDetailInfoViewController()
    }()
    
    private lazy var activityVC: TicketDetailActivityViewController = {
        return TicketDetailActivityViewController()
    }()
    
    //function
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupView() {
        super.setupView()

        addChild(activityVC)
        addChild(infoVC)
        
        add(infoVC, contentView: vInfo)
        vTab.delegate = self

        vTitle.lblTitle.text = "Ticket Information"
        
        vAction.controller = self
        
        self.view.setNeedsLayout()
    }

    @IBAction func actionBack() {
        didPopView()
    }
    
    @IBAction func actionExtend() {
        let vExtend = ExtendView.xibInstance()
        vExtend.frame = view.bounds
        vExtend.delegate = self
        
        let topViewController = UIApplication.getTopViewController()
        topViewController?.view.addSubview(vExtend)
        
        UIView.animate(withDuration: 0.35, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .transitionCurlUp, animations: {
            self.view.layoutIfNeeded()
        }) { (show) in
            if show {
                Logger.info(vExtend)
            }
        }
        
        //FIXME
//        ApplicationManager.sharedInstance.mainTabbar?.customTabbar.isHidden = true
    }

}

extension TicketDetailController: XibInitalization {
    typealias Element = TicketDetailController
}

extension TicketDetailController: TicketDetailExtendViewOutput {
    func didChooseExtendItem(_ item: String?) {
        let extendRoute = ExtendRoute()
        guard let itemEx = item else {
            return
        }
        
        var type : Extend_Type = .notes
        
        //find type for item
        for et in Extend_Type.allCases {
            if itemEx == et.rawValue {
                type = et
            }
        }
        
        //route
        extendRoute.handleData { (extendController) in
            //FIXME
            Logger.debug(type.rawValue)
            extendController.extendedType = type
        }
        
        //route to detail extend
        RouterManager.shared.handleRouter(extendRoute)
        
    }
}

extension TicketDetailController: TabViewOutput {
    func onTab(_ tab: TabOption) {
        switch tab {
        case .info:
            self.add(infoVC, contentView: self.vInfo)
        case .activities:
            self.add(activityVC, contentView: self.vInfo)
        }
    }
}
