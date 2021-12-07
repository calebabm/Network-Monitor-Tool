//
//  LocalView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI
import Combine

struct LocalView<T: ViewModel>: View {
    
    @ObservedObject var viewModel: T
    
    var body: some View {
        createView()
    }
    
    func createView() -> some View {
        guard let viewModel = viewModel as? LocalViewModel else {
            fatalError("Log: Unable to cast generic viewModel to direct type")
        }
        
        return Form {
            Section(header: Text("Single Connections")) {
                List(viewModel.localConnections.filter { $0.clients.count == 1 }, id: \.id) { (localConnection) in
                    LocalRowView(localConnection: localConnection)
                }
            }
            
            Section(header: Text("Group Connections")) {
                List(viewModel.localConnections.filter { $0.clients.count > 1 }, id: \.id) { (localConnection) in
                    LocalRowView(localConnection: localConnection)
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
