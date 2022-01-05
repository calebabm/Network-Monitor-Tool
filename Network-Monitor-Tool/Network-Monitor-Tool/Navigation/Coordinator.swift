//
//  Coordinator.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

class Coordinator {
    
    var router: Router
    var appState: AppState = .initialLaunch
    
    func updateState(state: AppState) {
        self.appState = state
    }
    
    func setup() {
        self.router.constructDependencies(self.appState)
    }
    
    //    func fetchDataCompleted(data: Data) {
    //        // logic of where to go
    //        // if user is in state 1, router.route(to: .fetchData(data)
    //        // if user is in state 2, presentView
    //
    //    }
    
    
    internal init(router: Router, appState: AppState = .initialLaunch) {
        self.router = router
        self.appState = appState
    }
}

