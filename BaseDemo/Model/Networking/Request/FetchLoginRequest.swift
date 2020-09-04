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
    var param: Self.BaseParameters
    
    func decode(data: Any) -> LoginObj {
        
        let jsObj = try? JSONSerialization.jsonObject(with: data as! Data, options: [.allowFragments]) as? [String : Any]
        
        
        return  LoginObj(JSON: jsObj!)!

    }
    
    
    typealias T = LoginObj
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var endPoint: String {
        return Constants.APIEndPoint.Login
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    init(param: BaseParameters?) {
        self.param = param!
    }
}
