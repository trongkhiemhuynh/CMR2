//
//  MainReducer.swift
//  BaseDemo
//
//  Created by macOS on 8/31/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation
import ReSwift

struct MainReducer {
    
}

func appReducer(action : Action, state : MainAppState?) -> MainAppState {

    let ticketState = TicketState.reducer(action: action, state: state?.ticketState)
    let loginState = LoginState.reducer(action: action, state: state?.loginState)
    
    // return
    return MainAppState(ticketState: ticketState, loginState: loginState)
}

//extension MainReducer : Reducer<Any> {
//
//    func handleAction(action : Action, state : MainAppState?) -> MainAppState {
////        let ticketState = TicketState.re
//
//        let ticketState = TicketState.reducer(action: action, state: state?.ticketState)
//
//        // return
//        return MainAppState(ticketState: ticketState)
//    }
//
//}
