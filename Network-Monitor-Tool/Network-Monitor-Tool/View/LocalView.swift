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
    @State var addTapped = false
    
    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea(.all)
            createView()
        }
    }
    
    func presentAddAlert() -> some View {
        return AddLocalConnectionView()
    }
    
    func createView() -> some View {
        guard let viewModel = viewModel as? LocalViewModel else {
            fatalError("Log: Unable to cast generic viewModel to direct type")
        }
        
        let singleConnectionHeader =
        VStack {
            HStack {
                Text("State")
                    .padding()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text("Host")
                    .padding()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text("Clients")
                    .padding()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text("Time")
                    .padding()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            Text("Single Connections")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
        }
        
        return ScrollView {
            LazyVStack {
                Section(header: singleConnectionHeader) {
                    ForEach(viewModel.localConnections.filter { $0.clients.count == 1 }, id: \.id) { (localConnection) in
                        LocalRowView(localConnection: localConnection)
                    }
                }
                Section(header:
                            Text("Group Connections")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.top)) {
                    ForEach(viewModel.localConnections.filter { $0.clients.count > 1 }, id: \.id) { (localConnection) in
                        LocalRowView(localConnection: localConnection)
                    }
                }
            }
        }
        .background(Color.offWhite)
        .navigationTitle("Local Connections")
        .toolbar {
            Button {
                addTapped = true
            }
        label: {
            Text("+")
                .font(.system(size: 30))
        }
        .sheet(isPresented: $addTapped) {
            viewModel.addTapped
            }
        }
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
