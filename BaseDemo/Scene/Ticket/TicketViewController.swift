//
//  TicketViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import Alamofire

class TicketViewController: BaseViewController {

//    var pageMenu : CAPSPageMenu?

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
    
    override func initData() {
//        Alamofire
//        getData()
        
//        Alamofire.request(url,
//                          method: .post,
//                          parameters: ["include_docs": "true"])
//        .validate()
//        .responseJSON { response in
//          guard response.result.isSuccess else {
//            print("Error while fetching remote rooms: \(String(describing: response.result.error)")
//            completion(nil)
//            return
//          }
//
//          guard let value = response.result.value as? [String: Any],
//            let rows = value["rows"] as? [[String: Any]] else {
//              print("Malformed data received from fetchAllRooms service")
//              completion(nil)
//              return
//          }
//
//          let rooms = rows.flatMap { roomDict in return RemoteRoom(jsonData: roomDict) }
//          completion(rooms)
//        }
        
//        let login = Login(email: "test@test.test", password: "testPassword")

        
     
        
    }
    
    @IBAction func actionNewTicket(sender : UIButton?) {
        
         print("--------- ", #function)
        
//        let newV = Bundle.main.loadNibNamed("CreatNewTicketView", owner: self, options: nil)?.first as! CreatNewTicketView
//        newV.frame = view.bounds
//        view.addSubview(newV)
        
        let vc = NewTicketViewController()
        
        navigationController?.pushViewController(vc, animated: false)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
    }

    func getData() {
        var json : [String : Any] = ["Record_per_page" : NSNumber(100), "Current_page": NSNumber(1)]
        
        //        exampleParameters["a"] = ["a1": "v1","a2": "v2"]
        
        debugPrint(json.description)
        
        let devUrlPush = URL.init(string:"http://172.23.90.170:8000/api/tenants/")
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        var request = URLRequest(url: devUrlPush!)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        let userDF = UserDefaults.standard
        let token = userDF.object(forKey: "token") as! String
        
        let authen = "Bearer \(token)"
        request.setValue(authen, forHTTPHeaderField: "Authorization")
        //        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        //            do {
        //                try request.setMultipartFormData(exampleParameters, encoding: .utf8)
        //            } catch {
        //                print(error.localizedDescription)
        //            }
        
        //        request.httpBody = createBody(parameters: exampleParameters)
        
        AF.request(request).responseJSON { (response) in
            
            debugPrint(response)
            
            if( response != nil)
            {
                
                
                
            }else
            {
                print("---error :",response.error?.localizedDescription)
            }
        }
        
        //        let string = String(data: request.httpBody!, encoding: .utf8)
        //        let jsonString = JSON(data: request.httpBody!)
        //        debugPrint(jsonString.rawString(.utf8, options: .prettyPrinted))
        //        debugPrint(string)
    }

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
