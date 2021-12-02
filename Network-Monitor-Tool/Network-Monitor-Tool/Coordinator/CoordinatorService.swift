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
    func presentNextView<T: ViewModel>(current: T) -> some View {
//        guard let main = current as? MainViewModel else {
//            fatalError()
//        }
//        if main.isButtonSelected {
            let services = (NetworkService(), CoordinatorService())
            let localViewModel = LocalViewModel(.dependencies(services))
            LocalView(localViewModel)
//        } else {
//            EmptyView()
//        }
    }
}
