//
//  FetchTicketWorker.swift
//  BaseDemo
//
//  Created by macOS on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import ReSwift
import PromiseKit

struct UpdateTicketListAction : Action {
    var ticketList: [TicketObj]?
}

class FetchTicketWorker: AsyncWorker {
    
    typealias T = [TicketObj]
    
    func execute() -> Promise<T> {
        
//        let ticketObjs = [TicketObj(), TicketObj()]
        //return
//        return Promise.value(ticketObjs)
//        return Promise([TicketObj()])
//        return Promise(value: ])
        
        return Networking.shared.fetchTicketList(with: "").then { (tkObjs) -> Promise<T> in
            // dispatch action
            let action = UpdateTicketListAction(ticketList: tkObjs)
            mainStore.dispatch(action)
            
            return Promise.value(tkObjs)
        }
    }
}
