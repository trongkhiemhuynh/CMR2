//
//  Networking.swift
//  BaseDemo
//
//  Created by macOS on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

typealias Handler = (_ data: [Any]?,_ error: Error?) -> Void

protocol AppAPIList {
    func checkToken()
}

class Networking: NSObject, AppAPIList {
    func checkToken() {
        
    }
    
    static let shared = Networking()
//    weak var delegate: LoginPresenterOutput?
    

    func fetchTicketList(with id: String) -> Promise<[TicketObj]>{
        
        let ticketRequest = FetchTicketRequest(param: ["id":id])
        return ticketRequest.toPromise()
    }
    
    func fetchLoginAuthentication(with username: String, password: String) -> Promise<LoginObj> {
        return FetchLoginRequest(param: ["email":username, "pass":password]).toPromise()
    }
    
    func fetchMenu(completion: @escaping Handler) {
        let strUrl = Constants.App.BaseURL + Constants.APIEndPoint.Menu
        
        let requestURL = URL(string: strUrl)
        var request = URLRequest(url: requestURL!)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        if let token = ApplicationManager.sharedInstance.getValueUserDefault(key: kTokenLoginUser) as? String {
            let authorization = "Bearer " + token
            request.setValue(authorization, forHTTPHeaderField: "Authorization")
            
            onUrlSession(request: request) { (dict, error) in
                if error != nil {
                    completion(nil, NSError.unknownError())
                } else {
                    
                    guard let dict = dict else { completion(nil, NSError.unknownError()); return }
                    
                    guard let d = dict["data"] as? [String: Any]  else { completion(nil, NSError.unknownError()); return }
                    
                    let arrKeys = d.keys
                    var arrMenu: Array<[String:String]> = []
                    
                    for key in arrKeys {
                        let value = d[key]
                        
                        if let val = value as? String {
                            let dict = [key:val]
                            arrMenu.append(dict)
                        }
                    }
                    
                    //handler array of dictionary
                    completion(arrMenu,nil)
                }
            }
        } else {
            completion(nil, NSError.sessionExpired())
            //            self.delegate?.presentError(NSError.sessionExpired())
        }
    }
    
    func fetchLogin(userName: String, password: String, completion: @escaping Handler) {
        let strUrl = Constants.App.BaseURL + Constants.APIEndPoint.Login
        
        let requestURL = URL(string: strUrl)
        var request = URLRequest(url: requestURL!)
        
        request.httpMethod = HTTPMethod.post.rawValue
        
        do {
            try! request.setMultipartFormData(["email":userName, "pass":password], encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
        //        request.httpBody = //qMes.data(using: .utf8)
        
        onUrlSession(request: request) { (dict, error) in
            if error != nil {
                completion(nil, NSError.unknownError())
            } else {
                guard let dict = dict else { completion(nil, NSError.unknownError()); return}
                
                if let token = dict["Token"] {
                    ApplicationManager.sharedInstance.saveUserDefault(value: token, key: kTokenLoginUser)
                    completion([kTokenLoginUser], nil)
                } else {
                    completion(nil, NSError.unknownError())
                }
            }
        }
                                    
    }
    
    func fetchObjectList(id: String, completion: @escaping Handler) {
        let strUrl = Constants.App.BaseURL + Constants.APIEndPoint.Menu_ListView
        
        let requestURL = URL(string: strUrl)
        var request = URLRequest(url: requestURL!)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        if let token = ApplicationManager.sharedInstance.getValueUserDefault(key: kTokenLoginUser) as? String {
            let authorization = "Bearer " + token
            request.setValue(authorization, forHTTPHeaderField: "Authorization")
            request.setValue(id, forHTTPHeaderField: "ID")
            
            request.setValue(String(1), forHTTPHeaderField: "CurrentPage")
            request.setValue(String(20), forHTTPHeaderField: "RecordPerPage")
            
            onUrlSession(request: request) { (dict, err) in
                print(dict)
                var arrItem: Array<String> = []
                guard let dic = dict else { return }
                
                guard let data = dic["data"] as? [String:Any] else {return}
                
                guard let key_list = data["key_list"] as? Array<[String:String]> else {return}
                var accountNameKey: String?
                
                for kl in key_list {
                    if (kl.values.first?.contains("Account"))! {
                        accountNameKey = kl.keys.first
                    }
                }
                
                guard let accKey = accountNameKey else {return}
                
                guard let result_query = data["result_query"] as? Array<[String:Any]> else {return}
                
                for it in result_query {
                    guard let data = it["Data"] as? Array<[String: Any]> else {return}
                    guard let dicData = data.first else {return}
                    
                    guard let accName = dicData[accKey] as? String else {return}
                    
                    arrItem.append(accName)
                }
                
                completion(arrItem, nil)
            }
        }
    }
    
    /// call api
    /// - Parameters:
    ///   - request: api request
    ///   - completion: completion handler
    private func onUrlSession(request: URLRequest, completion: @escaping (_ js: [String:Any]?, _ err: Error?) -> Void) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            DispatchQueue.main.async {
                if error != nil {
                    completion(nil, NSError.unknownError())
//                    self.delegate?.presentError(NSError.unknownError())
                } else {
                    if let dat = data {
                        if let json = try? JSONSerialization.jsonObject(with: dat, options: []) as? [String: Any] {
                            Logger.info(json)
                            
                            completion(json, nil)
                            
                        } else {
                            completion(nil, NSError.unknownError())
//                            self.delegate?.presentError(NSError.unknownError())
                        }
                    } else {
                        completion(nil, NSError.unknownError())
//                        self.delegate?.presentError(NSError.unknownError())
                    }
                }
            }
        }.resume()
    }
}

extension Networking: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        
        completionHandler(.useCredential, urlCredential)
    }
}
