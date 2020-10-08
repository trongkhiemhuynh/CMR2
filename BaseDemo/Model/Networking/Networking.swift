//
//  Networking.swift
//  BaseDemo
//
//  Created by macOS on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import PromiseKit

typealias Handler = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

class Networking: NSObject {
    static let shared = Networking()
    weak var delegate: LoginPresenterOutput?
    

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
        
        request.httpMethod = "GET"
        if let token = ApplicationManager.sharedInstance.getValueUserDefault(key: kTokenLoginUser) as? String {
            let authorization = "Bearer " + token
            request.setValue(authorization, forHTTPHeaderField: "Authorization")
            
            onUrlSession(request, completion: completion)
        } else {
            self.delegate?.presentError(NSError.sessionExpired())
        }
    }
    
    func fetchLogin(userName: String, password: String) {
        let strUrl = Constants.App.BaseURL + Constants.APIEndPoint.Login
        
        let requestURL = URL(string: strUrl)
        var request = URLRequest(url: requestURL!)
        
        request.httpMethod = "POST"
        
        do {
            try! request.setMultipartFormData(["email":userName, "pass":password], encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
        //        request.httpBody = //qMes.data(using: .utf8)
        
        onUrlSession(request, completion: nil)
    }
    
    private func onUrlSession(_ request: URLRequest, completion: Handler?) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        session.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            DispatchQueue.main.async {
                if error != nil {
                    //                    print("Error: \(error)")
                    self.delegate?.presentError(NSError.unknownError())
                } else {
                    //
                    //                    let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
                    //
                    //                     print(outputStr)
                    //                completionBlock(outputStr!);
                    
                    if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                        Logger.info(json)
                        
                        if let token = json["Token"] {
                            ApplicationManager.sharedInstance.saveUserDefault(value: token, key: kTokenLoginUser)
                            self.delegate?.pushView()
                        } else {
                            self.delegate?.presentError(NSError.unknownError())
                        }
                        
                        if let com = completion {
                            com(data, response, error)
                        }
                        
                    } else {
                        self.delegate?.presentError(NSError.unknownError())
                    }
                    
                    //                    print("khiemht : \(json?["Name"])")
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
