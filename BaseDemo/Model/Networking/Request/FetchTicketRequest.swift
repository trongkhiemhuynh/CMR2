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
    var param: Self.Parameters1
    
//    var param: Self.Parameters
    
//    var param: Self.Parameters
    
    
    typealias T = [TicketObj]
    
//    var param: Parameters1?
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endPoint: String {
        return Constants.APIEndPoint.TicketList
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func decode(data: Any) -> Array<TicketObj> {
        return Mapper<TicketObj>().mapArray(JSONObject: data) ?? []
    }
    
    // Init
    init(param: Parameters1?) {
        self.param = param!
    }
}
