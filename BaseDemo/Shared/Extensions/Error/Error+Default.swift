//
//  Error+Default.swift
//  BaseDemo
//
//  Created by macOS on 8/28/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

extension NSError {
    
    static func unknownError() -> NSError {
        let userInfo = [NSLocalizedDescriptionKey : "Unknown error"]
        
        return NSError(domain: "com.basebs", code: 999, userInfo: userInfo)
    }
    
    static func emptyUsernameOrPassword() -> NSError {
        let userInfo = [NSLocalizedDescriptionKey : "Invalid username or password!"]
        
        return NSError(domain: "com.basebs", code: 998, userInfo: userInfo)
    }
    
}
