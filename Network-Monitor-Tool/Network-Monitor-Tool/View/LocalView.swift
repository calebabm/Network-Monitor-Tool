//
//  LocalView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

struct LocalView<T: ViewModel>: View {
    private(set) var viewModel: T
    
     
     var body: some View {
         Text("Hello, world!")
             .padding()
     }
     
     init(_ viewModel: T) {
         self.viewModel = viewModel
     }
}

struct LocalView_Previews: PreviewProvider {
    static var previews: some View {
        let localVMServices = (networkService: NetworkService(), coordinatorService: CoordinatorService())
        let vm = LocalViewModel(.dependencies(localVMServices))
        LocalView(vm)
    }
}
