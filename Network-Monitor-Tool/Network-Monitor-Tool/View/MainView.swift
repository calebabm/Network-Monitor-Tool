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
    
    var body: some View {
        NavigationView {
            createView()
        }
    }
    
    func createView() -> some View {
        guard let viewModel = viewModel as? MainViewModel else {
            fatalError("Log: Unable to cast generic viewModel to direct type")
        }
        
        return List(viewModel.cellData, id: \.id) { (cell) in
            Section {
                NavigationLink {
                    viewModel.selected(cell: cell)
                } label: {
                    Text(cell.title)
                }
            }
        }
        .navigationTitle("Configure Connections")
        .navigationBarTitleDisplayMode(.inline)
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
