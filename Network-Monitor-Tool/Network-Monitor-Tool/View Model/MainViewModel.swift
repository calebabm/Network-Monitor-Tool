//
//  MainViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import Foundation
import SwiftUI

final class MainViewModel: ViewModel {
    typealias Services = CoordinatorService
    var dependencies: DependencyContainer<Services>
    
    var isButtonSelected: some View {
        return self.dependencies.services.presentNextView(current: self)
    }
    
    required init(_ dependencies: DependencyContainer<Services>) {
        self.dependencies = dependencies
    }
}
