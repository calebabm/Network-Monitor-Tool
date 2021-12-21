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
            var navController = NavController()
            var coordinator = Coordinator()
            let router = Router(navController: navController)
            //router update nav controller view controller view
//            coordinator.setup(router)
//            let mainViewModel = MainViewModel(.dependencies(coordinator))
            navController.view
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


enum AppState {
    case initialLaunch
}

struct NavController {
    var view: AnyView? = nil
}


struct Router {
    var navController: NavController
    
    mutating func constructDependencies(_ state: AppState) {
        switch state {
        case .initialLaunch:
            //TODO: Construct the depenecies for the view with the dependency containter
//            let viewModel= MainViewModel(T##dependencies: DependencyContainer<MainViewModel.Services>##DependencyContainer<MainViewModel.Services>)
            let mainViewModel = MainViewModel(.dependencies(CoordinatorService()))
            self.navController.view = MainView(mainViewModel) as? AnyView
        }
        
    }
}


struct Coordinator {
    
    private(set) var router: Router? = nil
    var appState: AppState = .initialLaunch
    
    mutating func setup(_ router: Router?) {
        self.router?.constructDependencies(self.appState)
    }
    
    //    func fetchDataCompleted(data: Data) {
    //        // logic of where to go
    //        // if user is in state 1, router.route(to: .fetchData(data)
    //        // if user is in state 2, presentView
    //
    //    }
}



//class Router {
//
//    lazy someDependancy:
//
//    init(with dependancies: DependencyContainer) {
//        someDependancy =
//    }
//
//    func route(to destination: Destination) {
//
//    }
//}

