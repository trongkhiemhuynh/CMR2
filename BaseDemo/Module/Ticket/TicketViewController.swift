//
//  TicketViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
//import PageMenu

class TicketViewController: BaseViewController {

//    var pageMenu : CAPSPageMenu?
    
    @IBOutlet weak var vTitle : CustomTitleView!
    @IBOutlet weak var vListView : CustomListView!
    
    @IBOutlet weak var vTicket : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        
        vTicket.backgroundColor = .red
        
        NotificationCenter.default.addObserver(forName: .StageName, object: nil, queue: nil) { (notif) in
            
            self.addAlertLoading()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.dismissAlertLoading()
            }
            
        }
        
        NotificationCenter.default.addObserver(forName: .DetailTicket, object: nil, queue: nil, using: { (noti) in
            
            let detailVC = TicketDetailController()
            
            self.present(detailVC, animated: false, completion: nil)
            
            
        })
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.title = "Ticket"
//
//        var arrController : [UIViewController] = []
//
//        let creatVC = CreateTicketViewController()
//        creatVC.title = "Created"
//
//        let assignVC = AssignTicketViewController()
//        assignVC.title = "Assigned"
//
//        let escalatVC = EscalatedViewController()
//        escalatVC.title = "Escalated"
//
//        arrController.append(creatVC)
//        arrController.append(assignVC)
//        arrController.append(escalatVC)
//
//        let parameters : [CAPSPageMenuOption] = [.menuItemSeparatorWidth(4.3),
//                                            .useMenuLikeSegmentedControl(true),
//                                            .menuItemSeparatorPercentageHeight(0.1),
//                                            .selectionIndicatorColor(UIColor(hex: BASEColor.MainHexColor)!),
//                                            .scrollMenuBackgroundColor (.blue),
//                                            .selectedMenuItemLabelColor (UIColor(hex: BASEColor.MainHexColor)!),
//                                            .unselectedMenuItemLabelColor (.black)]
//
//        pageMenu = CAPSPageMenu(viewControllers: arrController, frame: vTicket.frame, pageMenuOptions: parameters)
//        pageMenu?.delegate = self
//
//        self.view.addSubview(pageMenu!.view)
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

//extension TicketViewController : CAPSPageMenuDelegate {
//    func willMoveToPage(_ controller: UIViewController, index: Int) {
//        print(controller.title, index)
//    }
//    
//    func didMoveToPage(_ controller: UIViewController, index: Int) {
//        
//    }
//
//}
