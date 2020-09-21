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

struct FetchLoginRequest : Requestable {
    typealias T = LoginObj

    var param: Self.BaseParameters?
    
    func bodyRequest(request: inout URLRequest) {
        let _ = try! request.setMultipartFormData(self.param as! [String : String], encoding: .utf8)
    }
    
    func decode(data: Any) -> LoginObj {
        /// After receive data from server
        //FIXME
        let jsObj = try? JSONSerialization.jsonObject(with: data as! Data, options: []) as? [String : Any]
        
        return  LoginObj(JSON: jsObj!)!

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
    
    init(param: BaseParameters?) {
        self.param = param
    }

}
