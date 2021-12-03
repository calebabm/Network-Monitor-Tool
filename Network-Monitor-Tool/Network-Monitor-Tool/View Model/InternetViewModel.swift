//
//  InternetViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/2/21.
//

import SwiftUI

final class InternetViewModel: ViewModel {
    typealias Services = (networkService: NetworkService, coordinatorService: CoordinatorService)
    var dependencies: DependencyContainer<Services>
    
    required init(_ dependencies: DependencyContainer<Services>) {
        self.dependencies = dependencies
    }
}
