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
    
    func setup() -> AnyView {
        let navController = ViewFlowController(view: AnyView(EmptyView()))
        let router = Router(navController: navController)
        var coordinator = Coordinator(router: router)
        coordinator.setup()
        return navController.view
    }
}

