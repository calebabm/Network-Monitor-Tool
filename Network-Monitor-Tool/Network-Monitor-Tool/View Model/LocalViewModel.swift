//
//  LocalViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import Foundation
import SwiftUI

final class LocalViewModel: ViewModel {
    typealias Services = (networkService: NetworkService, coordinatorService: CoordinatorService)
    var dependencies: DependencyContainer<Services>
    
    required init(_ dependencies: DependencyContainer<Services>) {
        self.dependencies = dependencies
    }
}
