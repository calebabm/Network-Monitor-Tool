//
//  Coordinator.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI
import Combine

struct CoordinatorService {
    
    @ViewBuilder
    func presentView<T: ViewModel>(with dependencies: T) -> some View {
        let type = T.self
        switch type {
        case is MainViewModel.Type:
            MainView(dependencies)
        case is LocalViewModel.Type:
            LocalView(dependencies)
        case is InternetViewModel.Type:
            InternetView(dependencies)
        default:
            EmptyView()
        }
    }
}
