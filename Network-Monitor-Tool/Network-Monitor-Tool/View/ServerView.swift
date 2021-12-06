//
//  ServerView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/2/21.
//

import SwiftUI

struct ServerView<T: ViewModel>: View {
    
    @ObservedObject private var viewModel: T
    @State private var backButtonTapped = false
    @State private var createRequestTapped = false
    @State private var didSelectRow = false
    
    var body: some View {
        createView()
    }
    
    func createView() -> some View {
        guard let viewModel = viewModel as? ServerViewModel else {
            fatalError("Log: Unable to cast generic viewModel to direct type")
        }
        return Form {
            Button {
                createRequestTapped.toggle()
            } label: {
                Text("Create an HTTP Request")
            }
            Section(header: Text("Requests")) {
                List(viewModel.cellData, id: \.id) { (cell) in
                    Section {
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Text(cell.title)
                            Text(cell.timeStamp)
                            Text(cell.requestType)
                            Text(cell.status)
                        }
                    }
                }
            }
        }.navigationTitle("Server Requests")
    }
    
    init(_ viewModel: T) {
        self.viewModel = viewModel
    }
}

struct InternetView_Previews: PreviewProvider {
    static var previews: some View {
        let services = (networkService: NetworkService(), coordinatorService: CoordinatorService())
        let viewModel = ServerViewModel(.dependencies(services))
        ServerView(viewModel)
    }
}
