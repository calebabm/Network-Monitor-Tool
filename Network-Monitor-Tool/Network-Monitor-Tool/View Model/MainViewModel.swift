//
//  MainViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

final class MainViewModel: ViewModel {
    typealias Services = CoordinatorService
    var dependencies: DependencyContainer<Services>
    
    var isLocalButtonSelected: some View {
        let services = (NetworkService(), CoordinatorService())
        let localViewModel = LocalViewModel(.dependencies(services))
        return dependencies.services.presentView(with: localViewModel)
    }
    
    var isInternetButtonSelected: some View {
        let services = (NetworkService(), CoordinatorService())
        let internetViewModel = InternetViewModel(.dependencies(services))
        return dependencies.services.presentView(with: internetViewModel)
    }
    
    required init(_ dependencies: DependencyContainer<Services>) {
        self.dependencies = dependencies
    }
}
