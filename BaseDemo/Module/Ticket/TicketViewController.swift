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
        super.setupView()
        vTicket.backgroundColor = .red
        
        NotificationCenter.default.addObserver(forName: .StageName, object: nil, queue: nil) { (notif) in
            
            self.addAlertLoading()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.dismissAlertLoading()
            }
            
        }
        
        NotificationCenter.default.addObserver(forName: .DetailTicket, object: nil, queue: nil, using: { (noti) in
            
            // !!!FIX ME:
            let detailVC = TicketDetailController(nibName: "TicketDetailController", bundle: nil)
            self.navigationController?.pushViewController(detailVC, animated: true)
            
            
//            self.addChild(detailVC)
//            self.add(detailVC, contentView: self.view)
            
//            self.present(detailVC, animated: false, completion: nil)
            
            
        })
    }
    
    @IBAction func actionNewTicket(sender : UIButton?) {
        
         print("--------- ", #function)
        
        let newV = Bundle.main.loadNibNamed("CreatNewTicketView", owner: self, options: nil)?.first as! CreatNewTicketView
        newV.frame = view.bounds
        view.addSubview(newV)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
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
