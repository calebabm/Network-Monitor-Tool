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
        WindowGroup { () -> AnyView in
            setup()
        }
    }
}


func setup() -> AnyView {
    let navController = NavController(view: AnyView(EmptyView()))
    let router = Router(navController: navController)
    var coordinator = Coordinator(router: router)
    coordinator.setup()
    return navController.view
}

enum AppState {
    case initialLaunch
}

class NavController<T> {
    var view: T
    
    init(view: T) {
        self.view = view
    }
}


struct Router {
    var navController: NavController<AnyView>
    
    mutating func constructDependencies(_ state: AppState) {
        switch state {
        case .initialLaunch:
            //TODO: Construct the dependecies for the view with the dependency containter
            let mainViewModel = MainViewModel(.dependencies(CoordinatorService()))
            let viewController = MainView(mainViewModel)
            navController.view = AnyView(viewController)
            print(navController.view)
        }
    }
}


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
