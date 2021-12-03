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
    @State private var isLocalButtonSelected = false
    @State private var isInternetButtonSelected = false
    
    var body: some View {
        NavigationView {
            createTableView()
        }
    }
    
    //TODO: Use this approach to create cells with cell model rather than using buttons
//    List(viewModel.items.identified(by: \.id)) { item in
//                        Button(action: {
//                            // Save the object into a global store to be used later on
//                            self.viewModel.selectedItem = item
//                            // Present new view
//                            self.link.presented?.value = true
//                        }) {
//                            Text(value: item)
//                        }
//                    }
    
    func createTableView() -> some View {
        guard let viewModel = viewModel as? MainViewModel else {
            fatalError("Log: Unable to cast generic viewModel to direct type")
        }
        
        return Form {
            createCell(.local(view: viewModel.isLocalButtonSelected), managedState: $isLocalButtonSelected)
            createCell(.internet(view: viewModel.isInternetButtonSelected), managedState: $isInternetButtonSelected)
        }
        .navigationTitle("Configure Connections")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func createCell<T: View>(_ buttonType: CellDataSourceTypes<T>, managedState: Binding<Bool> ) -> some View {
        return Section {
            NavigationLink(
                buttonType.details.title,
                destination: buttonType.details.view,
                isActive: managedState
            )
        }
    }
    
    enum CellDataSourceTypes<T> {
        case local(view: T)
        case internet(view: T)
        
        var details: (view: T, title: String) {
            switch self {
            case .local(let view):
                return (view, "Local")
            case .internet(let view):
                return (view, "Internet")
            }
        }
    }
    
    init(_ viewModel: T) {
        self.viewModel = viewModel
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let services = CoordinatorService()
        let viewModel = MainViewModel(.dependencies(services))
        MainView(viewModel)
    }
}
