//
//  FetchLoginRequest.swift
//  BaseDemo
//
//  Created by macOS on 9/3/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Alamofire
import ObjectMapper

struct FetchLoginRequest : Requestable {
    var param: Self.BaseParameters
    
    func decode(data: Any) -> LoginObj {
        
//        return LoginObj(map: Map(mappingType: .toJSON, JSON: JSONSerialization.jsonObject(with: data, options: .allowFragments)))
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
        self.param = param
    }
}
