//
//  ServerView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/2/21.
//

import SwiftUI

struct ServerView<T: ViewModel>: View {
    
    @ObservedObject var viewModel: T
    @State private var createRequestTapped = false
    
    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea(.all)
            createView()
        }
    }
    
    func createView() -> some View {
        guard let viewModel = viewModel as? ServerViewModel else {
            fatalError("Log: Unable to cast generic viewModel to direct type")
        }
        
        let header =
        HStack {
            Text("URL")
                .padding()
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Text("Request Type")
                .padding()
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Text("Status")
                .padding()
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Text("Time")
                .padding()
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }.scaledToFit()
        
        return ScrollView {
            LazyVStack {
                Section(header: header) {
                    ForEach(viewModel.serverConnections, id: \.id) { (serverConnection) in
                        ServerRowView(serverConnection: serverConnection)
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
