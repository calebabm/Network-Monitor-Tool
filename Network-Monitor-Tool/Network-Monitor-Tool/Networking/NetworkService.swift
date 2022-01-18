//
//  NetworkService.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import Foundation
import NetKitLocal

struct NetworkService {
    let local = LocalNetworkService()
    
    func sendData() {
        local.send(data: Data(), to: "192.168.86.170") { result in
            switch result {
            case .success:
                print("successful send of data")
            case .failure(let error):
                fatalError("send error: \(error)")
            }
        }
    }
    
}
