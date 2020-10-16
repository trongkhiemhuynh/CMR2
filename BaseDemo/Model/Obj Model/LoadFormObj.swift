//
//  LoadFormObj.swift
//  BaseDemo
//
//  Created by macOS on 10/16/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import ObjectMapper

class LoadFormObj: Mappable {
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        message <- map["mess"]
        data <- map["data"]
        status <- map["status"]
    }
    
    var data: [DataObj]?
    var message: String?
    var status: Int?
}

class DataObj: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        dat <- map["Data"]
    }
    
    var dat: [DatObj]?
}

class DatObj: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["ID"]
        type <- map["type"]
        name <- map["name"]
        option <- map["option"]
    }
    
    var type: String?
    var name: String?
    var option: [Country]?
    var id: String?
}

class Country: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        value <- map["value"]
        label <- map["label"]
        active <- map["active"]
    }
    
    var value: String?
    var label: String?
    var active: Bool?
}
