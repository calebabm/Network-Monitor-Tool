//
//  LocalView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

struct LocalView<T: ViewModel>: View {
    
    @ObservedObject private var viewModel: T
    
    var body: some View {
        createView()
    }
    
    func createView() -> some View {
        guard let viewModel = viewModel as? LocalViewModel else {
            fatalError("Log: Unable to cast generic viewModel to direct type")
        }
        
        return Form {
            Section(header: Text("Single Connections")) {
                List(viewModel.cellData.filter { $0.clients.count == 1 }, id: \.id) { (cell) in
                    Section {
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Text(cell.state)
                            Text(cell.host)
                            Text(cell.clients[0])
                        }
                    }
                }
            }
            
            Section(header: Text("Group Connections")) {
                List(viewModel.cellData.filter { $0.clients.count > 1 }, id: \.id) { (cell) in
                    Section {
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Text(cell.state)
                            Text(cell.host)
                            ForEach(cell.clients, id: \.self) { cell in
                                Text(cell)
                                
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Local Connections")
    }
    
    init(_ viewModel: T) {
        self.viewModel = viewModel
    }
}

struct LocalView_Previews: PreviewProvider {
    static var previews: some View {
        let services = (networkService: NetworkService(), coordinatorService: CoordinatorService())
        let viewModel = LocalViewModel(.dependencies(services))
        LocalView(viewModel)
    }
}
