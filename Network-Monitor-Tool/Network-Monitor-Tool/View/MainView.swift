//
//  MainView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

struct MainView<T: ViewModel>: View {
    
    private(set) var viewModel: T
    
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
