//
//  TicketDetailController.swift
//  BaseDemo
//
//  Created by khiemht on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TicketDetailController: BaseViewController {

    @IBOutlet weak var vAction : CustomDetailActionView!
    @IBOutlet weak var vTab : CustomDetailTabView!
    @IBOutlet weak var vInfo : CustomDetailInfoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vTitle.lblTitle.text = "Ticket Information"
    }

    override func setupView() {
        super.setupView()
        
        let infoVC = TicketDetailInfoViewController()
        let activityVC = TicketDetailActivityViewController()
        
        addChild(activityVC)
        addChild(infoVC)
        
        add(infoVC, contentView: vInfo)
        
        NotificationCenter.default.addObserver(forName: .DetailTicketTab, object: nil, queue: nil) { (notif) in
            
            if let userInfo = notif.userInfo {
                
                let strNum = userInfo["action"] as! String
//                let test = Self
                
                if strNum == "0" {
                    self.add(infoVC, contentView: self.vInfo)
                } else {
                    self.add(activityVC, contentView: self.vInfo)
                }
            }
        }
    }

    @IBAction func actionBack() {
//        dismiss(animated: false, completion: nil)
//        remove()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionExtend() {
        let vExtend = TicketDetailExtendView.xibInstance()
        vExtend.frame = view.bounds
        
        let topViewController = UIApplication.getTopViewController()
        topViewController?.view.addSubview(vExtend)
        
        UIView.animate(withDuration: 0.35, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .transitionCurlUp, animations: {
            self.view.layoutIfNeeded()
        }) { (show) in
            if show {
                Logger.info(vExtend)
            }
        }
        
        ApplicationManager.sharedInstance.mainTabbar?.customTabbar.isHidden = true
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

extension TicketDetailController : XibInitalization {
    typealias Element = TicketDetailController
}
