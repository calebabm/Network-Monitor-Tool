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
            ZStack {
                Color.offWhite
                    .ignoresSafeArea()
                createView()
            }
        }
    }
    
    func createView() -> some View {
        guard let viewModel = viewModel as? MainViewModel else {
            fatalError("Log: Unable to cast generic viewModel to direct type")
        }
        
        return ScrollView {
            LazyVStack {
                ForEach(viewModel.dataSource, id: \.id) { (cell) in
                    MainViewCell(cellData: cell, destination: viewModel.selected(cell: cell))
                        .listRowBackground(Color.red)
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
