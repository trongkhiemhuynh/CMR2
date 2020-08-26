//
//  Coordinator.swift
//  BaseDemo
//
//  Created by macOS on 8/26/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import Foundation

class Coordinator {
    private(set) var childCoordinators : [Coordinator] = []
    
    func start() {
        preconditionFailure("This method need to overriden by concrete subclass")
    }
    
    func finish() {
        preconditionFailure("This method need to overriden by concrete subclass")
    }
    
    func addChildCoordinator(_ coordinator : Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator : Coordinator) {
        
        if let index = childCoordinators.firstIndex(of : coordinator) {
            childCoordinators.remove(at: index)
        } else {
            print("could not remove child")
        }
        
    }
    
    func removeAllChildCoordinatorsWith<K>(type: K.Type) {
        childCoordinators = childCoordinators.filter { $0 is K == false
        }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
}

extension Coordinator : Equatable {
    static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs === rhs
    }
}
