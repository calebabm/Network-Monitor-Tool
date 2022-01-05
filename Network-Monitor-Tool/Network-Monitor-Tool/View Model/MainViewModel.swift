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
    
    @ViewBuilder
    func selected(cell: CellData) -> some View {
        if cell.id == dataSource[0].id {
            dependencies.services.presentView(with: LocalViewModel(.dependencies((NetworkService(), Coordinator()))))
        } else {
            dependencies.services.presentView(with: ServerViewModel(.dependencies((NetworkService(), Coordinator()))))
        }
    }
    
    required init(_ dependencies: DependencyContainer<Services>) {
        self.dependencies = dependencies
    }
}
