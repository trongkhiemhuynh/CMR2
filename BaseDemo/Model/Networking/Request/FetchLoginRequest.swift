//
//  FetchLoginRequest.swift
//  BaseDemo
//
//  Created by macOS on 9/3/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Alamofire
import ObjectMapper
import Foundation
import PromiseKit

class FetchLoginRequest : NSObject, Requestable, URLSessionDelegate {
    
    typealias T = LoginObj

    var param: BaseParameters?
    
    func bodyRequest(request: inout URLRequest) {
        let _ = try! request.setMultipartFormData(self.param as! [String : String], encoding: .utf8)
    }
    
    func decode(data: Any) -> LoginObj? {
        /// After receive data from server
        //FIXME
        
        if let d = data as? Data {
            print("khiemht: " + String(data: d, encoding: .utf8)!)
            
            if let jsObj = try? JSONSerialization.jsonObject(with: d, options: []) as? [String : Any] {
                Logger.info(jsObj)
                
                return LoginObj(JSON: jsObj)!
            } else {
                return nil
            }
        } else {
            return nil
        }
        
        
        
//        let obj = LoginObj(JSON: ["Name":"Steve Jobs","Tenant":"112345","Token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"])
//
//        return obj!
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var endPoint: String {
        return Constants.APIEndPoint.Login
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    // Additional Header
    var addionalHeader: BaseHeaderParameter? {
        return ["Accept":"application/json","Content-Type":"multipart/form-data"]
    }
    
    required init(param: BaseParameters?) {
        self.param = param
    }
    
    func toPromise() -> Promise<T> {
        return Promise<T> { seal in
            guard let urlRequest = try? self.asURLRequest() else {
                seal.reject(NSError.unknownError())
                return
            }
            
            //timeout
            //            AF.sessionConfiguration.timeoutIntervalForRequest = 20
            
            //            let urlSessionConfiguration = URLSessionConfiguration.default
            //            urlSessionConfiguration.timeoutIntervalForRequest = 20
            //
            //            let serverTrustManager = ServerTrustManager(evaluators: [Constants.App.BaseURL: DisabledTrustEvaluator()])
            //
            //            let session = Session(configuration: urlSessionConfiguration, delegate: SessionDelegate(), rootQueue: DispatchQueue.global(), startRequestsImmediately: true, requestQueue: nil, serializationQueue: nil, interceptor: nil, serverTrustManager: serverTrustManager, redirectHandler: nil, cachedResponseHandler: nil, eventMonitors: [])
            
            //            session.serverTrustManager = ServerTrustManager(evaluators: [Constants.App.BaseURL: DisabledTrustEvaluator()])
            
            
            
            
            //            session.request(urlRequest)
            //                .validate(statusCode: 200..<300)
            //                //                .validate(contentType: ["application/json"])
            //                .responseJSON(completionHandler: { (response) in
            //
            //                    Logger.info("-------\n response : \(response)")
            //                    let result = response.result
            //
            //                    switch response.result {
            //                    case .success(_):
            //
            //                        Logger.debug(response.result)
            //                        //check response
            //
            //                        guard let data = response.data else {
            //                            seal.reject(NSError.unknownError())
            //                            return
            //                        }
            //
            //                        let result = self.decode(data: data)
            //
            //                        seal.fulfill(result)
            //
            //                    case .failure(_):
            //
            //                        if let res = response.response {
            //                            let error = NSError(domain: "com.basebs.crm", code: res.statusCode , userInfo:[NSLocalizedDescriptionKey : response.error?.localizedDescription])
            //                            seal.reject(error)
            //                        } else {
            //                            seal.reject(NSError.unknownError())
            //                        }
            //
            //                    }
            //
            //                })
            
            let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
            
            session.dataTask(with: urlRequest) {
                (data: Data?, response: URLResponse?, error: Error?) in
                
                if(error != nil) {
                    print("Error: \(error)")
                    let error = NSError(domain: "com.basebs.crm", code: 1234, userInfo:[NSLocalizedDescriptionKey : error?.localizedDescription])
                    seal.reject(error)
                } else {
                    
                    //                          let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
                    //
                    //                            print(outputStr)
                    if let result = self.decode(data: data) {
                        seal.fulfill(result)
                    } else {
                        seal.reject(NSError.unknownError())
                    }

                }
            }.resume()
        }
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)

        completionHandler(.useCredential, urlCredential)
    }

}
