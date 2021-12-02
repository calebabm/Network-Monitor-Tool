//
//  MainView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI
import Combine

struct MainView<T: ViewModel>: View {
    
   @ObservedObject private var viewModel: T
    @State var isSelected = false
    
    var body: some View {
        if let vm = viewModel as? MainViewModel {
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
            }
            .sheet(isPresented: $isSelected, onDismiss: nil) {
                vm.isButtonSelected
            }
        } else {
            EmptyView()
        }
    }
    
    init(_ viewModel: T) {
        self.viewModel = viewModel
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinatorService = CoordinatorService()
        let vm = MainViewModel(.dependencies(coordinatorService))
        MainView(vm)
    }
}
