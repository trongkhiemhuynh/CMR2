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
    var param : BaseParameters {get}
    var addionalHeader : HeaderParameter? {get}
    var parameterEncoding: ParameterEncoding {get}
    func toPromise() -> Promise<T>
    
    func decode(data: Any) -> T
    
    init(param: Parameters?)
}

extension Requestable {
    // Variable
    typealias BaseParameters = [String: Any]
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
    /// Alamofire request to webservice
    func toPromise() -> Promise<T> {
        
        return Promise<T> {  seal in
            guard let urlRequest = try? self.asURLRequest() else {
                seal.reject(NSError.unknownError())
                return
            }
            
            AF.request(urlRequest)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseJSON(completionHandler: { (response) in
                    
                    switch response.result {
                    case .success(_):

                        // Check Response
                        guard let data = response.data else {
                            seal.reject(NSError.unknownError())
                            return
                        }
                        
                        let result = self.decode(data: data)
                        
                        seal.fulfill(result)

                    case .failure(_):
                        seal.reject(NSError.unknownError())
                    }
                    
                   
                })
        }

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
