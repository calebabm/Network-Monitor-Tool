//
//  InternetView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/2/21.
//

import SwiftUI

struct InternetView<T: ViewModel>: View {
    
    @ObservedObject private var viewModel: T
    @State private var backButtonTapped = false
    @State private var createRequestTapped = false
    @State private var didSelectRow = false
    
    var body: some View {
        Form {
            Button {
                createRequestTapped.toggle()
            } label: {
                Text("Create an HTTP Request")
            }
            Section(header: Text("Requests")) {
                ForEach(0..<25) { number in
                    NavigationLink(
                        "TimeStamp | RequestType | Status",
                        destination: EmptyView(),
                        isActive: $didSelectRow
                    )
                }
            }
        }.navigationTitle("Internet Connections")
    }
    
    init(_ viewModel: T) {
        self.viewModel = viewModel
    }
}

struct InternetView_Previews: PreviewProvider {
    static var previews: some View {
        let services = (networkService: NetworkService(), coordinatorService: CoordinatorService())
        let viewModel = InternetViewModel(.dependencies(services))
        InternetView(viewModel)
    }
}
