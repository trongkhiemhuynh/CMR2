//
//  Networking.swift
//  BaseDemo
//
//  Created by macOS on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import PromiseKit



class Networking {
    static let shared = Networking()
    
    func fetchTicketList(with id : String) -> Promise<[TicketObj]>{
        
        let ticketRequest = FetchTicketRequest(param: ["id":id])
        return ticketRequest.toPromise()
    }
}
