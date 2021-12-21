//
//  Network_Monitor_ToolApp.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

@main
struct Network_Monitor_ToolApp: App {
    var body: some Scene {
        WindowGroup {
            var naviController = NavController()
            let coordinator = CoordinatorService()
            let router = Router(navController: naviController)
            //router update nav controller view controller view
//            coordinator.setUp(_ router: router)
//            let mainViewModel = MainViewModel(.dependencies(coordinator))
            naviController.view
        }
    }
}

// in window group thing:
// let navController
// let dependencyContainer
// let router(dependencyContainer, navController)
// let coordinator(router)

// coordinator.setup()

// coordinator chooses where to go first, then the router constructs that view with it's dependancies from the dependency container


struct NavController<T: View> {
    lazy var view: T
}


struct Router {
    var navController: NavController
}
