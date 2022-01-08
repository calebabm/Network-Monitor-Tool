//
//  MainViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

final class MainViewModel: ViewModel {
    typealias Services = Coordinator
    var dependencies: DependencyContainer<Services>
    
    var dataSource = [
        CellData(title: "Local"),
        CellData(title: "Server")
    ]
    
    func selected(cell: CellData) -> AnyView {
        if cell.title == "Local" {
            dependencies.services.updateState(state: .localView)
            dependencies.services.setup()
        } else {
            dependencies.services.updateState(state: .serverView)
            dependencies.services.setup()
        }
        
        let viewFlowController = dependencies.services.router.viewFlowController
        return viewFlowController.view
    }
    
    required init(_ dependencies: DependencyContainer<Services>) {
        self.dependencies = dependencies
    }
}
