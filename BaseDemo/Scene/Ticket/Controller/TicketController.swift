//
//  TicketViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import Alamofire

protocol CustomListViewInput: class {
    func updateListView(with stage : String?)
}

class TicketController: BaseViewController {
    
    @IBOutlet weak var vListView : CustomListView!
    @IBOutlet weak var vStage : CustomTicketStageView!
    @IBOutlet weak var vTicket : UIView!
    
    // delegate
    weak var delegate : CustomListViewInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        super.setupView()

        vListView.delegate = self
        vStage.delegate = self
        vListView.controller = self
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
        RouterManager.shared.handleRouter(NewTicketRoute())
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

extension TicketController : XibInitalization {
    typealias Element = TicketController
}

extension TicketController : CustomListViewOutput {
    func didChangeSort(with name: String?) {
        let vSort = SortContactsView.xibInstance()
        vSort.selectedItemName = self.vListView.btnSorted.titleLabel?.text
        view.addSubview(vSort)
        vSort.frame = view.frame
        vSort.delegate = self
    }
    
    func didSelectItem(with id: String) {
        RouterManager.shared.handleRouter(TicketDetailRoute())
    }
}

extension TicketController : CustomTicketStageViewOutput {
    func didChangeStage(name: String?) {
        //delegate to subview
        delegate?.updateListView(with: name)
    }
}

extension TicketController: SortContactsViewOutput {
    func didSelect(item: String?) {
        vListView.btnSorted.setTitle(item, for: .normal)
    }
}
