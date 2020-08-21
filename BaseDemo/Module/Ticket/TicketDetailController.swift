//
//  TicketDetailController.swift
//  BaseDemo
//
//  Created by khiemht on 8/21/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TicketDetailController: BaseViewController {

    @IBOutlet weak var vTitle : CustomTitleView!
    @IBOutlet weak var vAction : CustomDetailActionView!
    @IBOutlet weak var vTab : CustomDetailTabView!
    @IBOutlet weak var vInfo : CustomDetailInfoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vTitle.lblTitle.text = "Ticket Information"
    }

    override func setupView() {
        let infoVC = TicketDetailInfoViewController()
        let activityVC = TicketDetailActivityViewController()
        
        addChild(activityVC)
        addChild(infoVC)
        
        add(infoVC, contentView: vInfo)
        
        print("debug --- \(vInfo.frame) -- window -- \(UIScreen.main.bounds)")
        
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
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func actionExtend() {
        // add more
        
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
