//
//  CustomTabbar.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TabMenuController : BaseViewController {

    @IBOutlet weak var vContent : UIView!
    
    var dashVC : UIViewController!
    var ticketVC : UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    override func setupView() {
        
        // controller
        dashVC = DashboardController()
        ticketVC = TicketViewController()
        
        self.addChild(dashVC)
        self.addChild(ticketVC)
        
        // init homeView
        self.add(dashVC, contentView: vContent)
        
        NotificationCenter.default.addObserver(forName: .TabbarName, object: nil, queue: nil) { (notification) in
            print(notification.userInfo?["name"])
            self.changeScreen(notification)
        }
    }
    
    func changeScreen(_ notif : Notification?) {
        
        if let noti = notif {
            
            let name = noti.userInfo!["name"] as! String
            
            switch name.lowercased() {
            
            case "home":
                // add child view
                
                self.add(dashVC, contentView: vContent)
                
                break
                
            case "ticket":
                
                self.add(ticketVC, contentView: vContent)
                
                break
            
            default:
                print("unknown")
            }
        }
 
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
