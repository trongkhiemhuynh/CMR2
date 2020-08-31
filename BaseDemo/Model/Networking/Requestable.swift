//
//  Requestable.swift
//  BaseDemo
//
//  Created by macOS on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire
import ObjectMapper

protocol Requestable {
    associatedtype T
    
    var basePath : String {get}
    var endPoint : String {get}
    var httpMethod : HTTPMethod {get}
    var param : Parameters1 {get}
    var addionalHeader : HeaderParameter? {get}
    var parameterEncoding: ParameterEncoding {get}
    func toPromise() -> Promise<T>
    
    func decode(data: Any) -> T
    
    init(param: Parameters?)
}

extension Requestable {
    // Variable
    typealias Parameters1 = [String: Any]
    typealias HeaderParameter = [String: String]
    typealias JSONDictionary = [String: Any]
    
    // Base
    var basePath: String {
        get { return Constants.App.BaseURL}
    }
    
     // Param
     var param: Parameters? {
         get { return nil }
     }
     
     
     // Additional Header
     var addionalHeader: HeaderParameter? {
         get { return nil }
     }
     
     
     // Default
     var defaultHeader: HeaderParameter {
         get { return ["Accept": "application/json"] }
     }
    
    
    
    
    // Path
    var urlPath: String {
        return basePath + endPoint
    }
    
    // URL
    var url: URL {
        return URL(string: urlPath)!
    }
    
    // Encoode
    var parameterEncoding: ParameterEncoding {
        get { return JSONEncoding.default }
    }
    
    // Promise
    func toPromise() -> Promise<T> {
        let promise = Promise()
        return promise as! Promise<Self.T>

//        return Promise { (fulfill, reject) in
//
//            guard let urlRequest = try? self.asURLRequest() else {
//                reject(NSError.unknowError())
//                return
//            }
//
//            Alamofire.request(urlRequest)
//                .validate(statusCode: 200..<300)
//                .validate(contentType: ["application/json"])
//                .responseJSON(completionHandler: { (response) in
//
//                    // Check error
//                    if let error = response.result.error {
//                        reject(error as NSError)
//                        return
//                    }
//
//                    // Check Response
//                    guard let data = response.result.value else {
//                        reject(NSError.jsonMapperError())
//                        return
//                    }
//
//                    // Parse here
//                    let result = self.decode(data: data)
//
//                    // Fill
//                    fulfill(result)
//                })
//        }
    }
    
    // Build URL Request
    func buildURLRequest() -> URLRequest {
        
        // Init
        var urlRequest = URLRequest(url: self.url)
        urlRequest.httpMethod = self.httpMethod.rawValue
        urlRequest.timeoutInterval = TimeInterval(10 * 1000)
        
        // Encode param
        var request = try! self.parameterEncoding.encode(urlRequest, with: self.param)
        
        // Add addional Header if need
        if let additinalHeaders = self.addionalHeader {
            for (key, value) in additinalHeaders {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
}

// MARK: - Conform URLConvitible from Alamofire
extension Requestable {
    func asURLRequest() -> URLRequest {
        return self.buildURLRequest()
    }
}
