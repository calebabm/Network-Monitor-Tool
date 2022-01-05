//
//  Coordinator.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

struct Coordinator {
    
    var router: Router
    var appState: AppState = .initialLaunch
    
    mutating func setup() {
        self.router.constructDependencies(self.appState)
    }
    
    //    func fetchDataCompleted(data: Data) {
    //        // logic of where to go
    //        // if user is in state 1, router.route(to: .fetchData(data)
    //        // if user is in state 2, presentView
    //
    //    }
}

