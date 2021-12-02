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
            /*
             FIXME: Is this really better than just doing:
             FIXME: let mainViewModel = MainViewModel()
             FIXME: mainViewModel.config(coordinator: Coordinator())
            */
            let coordinator = CoordinatorService()
            let mainViewModel = MainViewModel(.dependencies(coordinator))
            MainView(mainViewModel)
        }
    }
}
