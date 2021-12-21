//
//  ViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import Combine
import SwiftUI

protocol ViewModel: ObservableObject {
    associatedtype Services
    var dependencies: DependencyContainer<Services> { get set }
    init(_ : DependencyContainer<Services>)
}


////////////////////

struct AsdfView: View {

    let viewModel: AsdfViewModel

    var body: some View {
        Button("") {
            viewModel.checkSomething()
        }
    }
}

//protocol ViewModelAble {
//    func checkSomething()
//}

class AsdfViewModel: ObservableObject {

    var someSubject = PassthroughSubject<Void, Never>()

    init(networkService: NetworkServicable) {

    }

    func checkSomething() {
        someSubject.send()
    }
}

protocol NetworkServicable {
    func getDatData() -> Data
}

struct NetworkServiceSpy: NetworkServicable {
    func getDatData() -> Data {
        return Data()
    }
}

class Netttt: NetworkServicable {
    
    init(backendService: SomeBackendInterfaceControllerThing) {
        
    }
    
    func getDatData() -> Data {
        return Data()
    }
    
    
}

class SomeBackendInterfaceControllerThing {
    
}

