//
//  FetchTicketRequest.swift
//  BaseDemo
//
//  Created by macOS on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Alamofire
import ObjectMapper

struct FetchTicketRequest : Requestable {
    var param: Self.BaseParameters?
    
    func bodyRequest(request: inout URLRequest) {
        
    }
    
    typealias T = [TicketObj]
    
//    var param: Parameters1?
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endPoint: String {
        return Constants.APIEndPoint.Tenant
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func decode(data: Any) -> Array<TicketObj> {
        return Mapper<TicketObj>().mapArray(JSONObject: data) ?? []
    }
    
    // Init
    init(param: BaseParameters?) {
        self.param = param
    }
}
