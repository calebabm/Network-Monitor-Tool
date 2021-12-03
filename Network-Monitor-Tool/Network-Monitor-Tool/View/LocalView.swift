//
//  LocalView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

struct LocalView<T: ViewModel>: View {
    
    @ObservedObject private var viewModel: T
    @State var didSelectRow = false
    
    var body: some View {
        Form {
            Section(header: Text("Single Connections")) {
                ForEach(0..<15) { number in
                    //TODO: Create an array in the view model for the number of cells, use the number in the for each as the index for the element in the array to use for each cell viewModel.cells[number]
                    NavigationLink(
                        "Local Connection View",
                        destination: EmptyView(),
                        isActive: $didSelectRow
                    )
                }
            }
            
            Section(header: Text("Group Connections")) {
                ForEach(0..<15) { number in
                    NavigationLink(
                        "Local Connection View",
                        destination: EmptyView(),
                        isActive: $didSelectRow
                    )
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
