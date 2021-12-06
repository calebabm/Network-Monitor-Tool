//
//  ServerViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/2/21.
//

import SwiftUI

final class ServerViewModel: ViewModel {
    typealias Services = (networkService: NetworkService, coordinatorService: CoordinatorService)
    var dependencies: DependencyContainer<Services>
    
    var cellData = [
        ServerCell(title: "revelup.com", timeStamp: "12:10", requestType: "POST", status: "404"),
        ServerCell(title: "revelup.com", timeStamp: "1:30", requestType: "GET", status: "200"),
        ServerCell(title: "revelup.com", timeStamp: "2:33", requestType: "GET", status: "200")
    ]
    
    required init(_ dependencies: DependencyContainer<Services>) {
        self.dependencies = dependencies
    }
}
