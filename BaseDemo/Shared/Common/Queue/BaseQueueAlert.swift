//
//  BaseQueueAlert.swift
//  BaseDemo
//
//  Created by khiemht on 9/20/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

protocol BaseQueueProtocol {
    func addOperation(operations: [Operation])
}

class BaseQueueAlert: BaseQueueProtocol {

    public static let shared = BaseQueueAlert()
    
    private var queue : OperationQueue {
        let q = OperationQueue()
        q.maxConcurrentOperationCount = 1
        return q
    }
    
    //function
    func addOperation(operations: [Operation]) {
        for operation in operations {
            queue.addOperation(operation)
        }
    }
}
