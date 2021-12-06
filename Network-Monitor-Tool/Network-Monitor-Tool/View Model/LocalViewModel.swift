//
//  LocalViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

final class LocalViewModel: ViewModel {
    typealias Services = (networkService: NetworkService, coordinatorService: CoordinatorService)
    var dependencies: DependencyContainer<Services>
    
    var cellData = [
        LocalCell(title: "", state: "Connected", host: "172.20.10.3", client: ["172.20.10.4"]),
        LocalCell(title: "", state: "Offline", host: "172.20.10.3", client: ["172.20.10.5"]),
        LocalCell(title: "", state: "Offline", host: "172.20.10.3", client: ["172.20.10.6"]),
        LocalCell(title: "", state: "Offline", host: "172.20.10.3", client: ["172.20.10.7", "172.20.10.8", "172.20.10.9"]),
        LocalCell(title: "", state: "Offline", host: "172.20.10.3", client: ["172.20.10.10", "172.20.10.11", "172.20.10.12"])
    ]
    
    required init(_ dependencies: DependencyContainer<Services>) {
        self.dependencies = dependencies
    }
}
