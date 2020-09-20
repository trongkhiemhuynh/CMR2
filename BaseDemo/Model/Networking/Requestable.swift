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

/// Requestable function
protocol Requestable {
    associatedtype T
    
    var basePath : String {get}
    var endPoint : String {get}
    var httpMethod : HTTPMethod {get}
    var param : BaseParameters? {get set}
    var addionalHeader : BaseHeaderParameter? {get}
    var parameterEncoding: ParameterEncoding {get}
    func toPromise() -> Promise<T>
    
    func decode(data: Any) -> T
    
    func bodyRequest(request: inout URLRequest)
    
    init(param: BaseParameters?)
}

extension Requestable {
    // Variable
    typealias BaseParameters = [String: Any]
    typealias BaseHeaderParameter = [String: String]
//    typealias JSONDictionary = [String: Any]
    
    //endpoint
    var basePath: String {
        get { return Constants.App.BaseURL}
    }
    
    //param
    var param: BaseParameters? {
        get { return nil }
    }
    
    //additional header
    var addionalHeader: BaseHeaderParameter? {
        get { return nil }
    }
    
    //header
    var defaultHeader: BaseHeaderParameter {
        get { return ["ContentType": "application/json"] }
    }
    
    //full url
    var urlPath: String {
        return basePath + endPoint
    }
    
    //urlPath
    var url: URL {
        return URL(string: urlPath)!
    }
    
    // Encode
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
//                .validate(contentType: ["application/json"])
                .responseJSON(completionHandler: { (response) in
                    
                    Logger.debug("-------\n response : \(response)")
                    
                    switch response.result {
                    case .success(_):
                        Logger.debug(response.result)
                        // Check Response
                        guard let data = response.data else {
                            seal.reject(NSError.unknownError())
                            return
                        }
                        
                        let result = self.decode(data: data)
                        
                        seal.fulfill(result)
                        
                    case .failure(_):
//                        let error = NSError(domain: "com.basebs.crm", code: response.response!.statusCode , userInfo:[NSLocalizedDescriptionKey : response.error?.localizedDescription])
//                        Logger.error(error)
//
//                        seal.reject(error)
                        
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
//        var request = try! self.parameterEncoding.encode(urlRequest, with: self.param)

        bodyRequest(request: &urlRequest)
        // Add addional Header if need
        if let additinalHeaders = self.addionalHeader {
            for (key, value) in additinalHeaders {
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        //log request
        Logger.info(urlRequest.httpMethod!)
        Logger.info(urlRequest.allHTTPHeaderFields!)
        Logger.info(urlRequest.httpBody?.base64EncodedString(options: .endLineWithCarriageReturn))
        
        return urlRequest
    }
}

// MARK: - Conform URLConvitible from Alamofire
extension Requestable {
    func asURLRequest() -> URLRequest {
        return self.buildURLRequest()
    }
}
