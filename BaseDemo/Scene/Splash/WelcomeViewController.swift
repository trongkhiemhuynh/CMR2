//
//  PreviewWelcomeViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/7/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var vLarge: UIView!
    @IBOutlet weak var ivUser : UIImageView!
    @IBOutlet weak var constraintIvUser: NSLayoutConstraint!
    @IBOutlet weak var ivAgree: UIImageView!
    @IBOutlet weak var vCircle: UIView!
    
    deinit {
        print("deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        
        ivAgree.isHidden = true
        
        let color = BASEColor.MainAppColor()
        print(color!)
        
        vCircle.backgroundColor = color
        vCircle.layer.cornerRadius = vCircle.bounds.width/2
        
        vLarge.backgroundColor = .clear
        vLarge.layer.borderWidth = 18.0
        vLarge.layer.borderColor = UIColor(red: 217/255, green: 243/255, blue: 241/255, alpha: 1.0).cgColor // 217 243 241
        vLarge.layer.cornerRadius = vLarge.bounds.width/2
        
        ivUser.layer.cornerRadius = ivUser.bounds.height/2
        ivAgree.layer.cornerRadius = ivAgree.bounds.height/2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.animationStick()
        
    }
    
    func navigationToMainController() {
//        let tabbar = TabMenuController(nibName: "TabMenuController", bundle: nil)
        
//        let dashboardVC = DashboardViewController()
//        let ticketVC =  TicketViewController()
        
//        let navDash = UINavigationController(rootViewController: dashboardVC)
//        let navTicket = UINavigationController(rootViewController: ticketVC)
        
//        cTabbar.viewControllers = [navDash, navTicket]
//        let dashItem = cTabbar.tabBar.items?.first
//        let ticketItem = cTabbar.tabBar.items?.last
        
//        dashItem?.title = "Dashboard"
//        dashItem?.image = UIImage(named: "icons8-dashboard-24")
//        
//        ticketItem?.title = "Ticket"
//        ticketItem?.image = UIImage(named: "icons8-movie-ticket-24")
        
        let tabbarMenu = NavigationMenuBaseController(nibName: "NavigationMenuBaseController", bundle: nil)
        let window = UIApplication.shared.delegate?.window
        
        window??.rootViewController = tabbarMenu
        
//        present(tabbarMenu, animated: false) {
//            print("completed preview")
//        }

    }
    
    func animationStick() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            self.view.layoutIfNeeded()
            self.constraintIvUser.constant = 50
            
            UIView.animate(withDuration: 0.35, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (success) in
                self.ivAgree.isHidden = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.navigationToMainController()
                    
                })
            })
            
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

extension WelcomeViewController : XibInitalization {
    typealias Element = WelcomeViewController
}
