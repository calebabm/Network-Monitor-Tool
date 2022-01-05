//
//  Router.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/28/21.
//

import SwiftUI

struct Router {
    var viewFlowController: ViewFlowController<AnyView>
    
    mutating func constructDependencies(_ state: AppState) {
        switch state {
        case .initialLaunch:
            //TODO: Construct the dependecies for the view with the dependency containter
            let mainViewModel = MainViewModel(.dependencies(Coordinator()))
            let viewController = MainView(mainViewModel)
            viewFlowController.view = AnyView(viewController)
        }
    }
}
