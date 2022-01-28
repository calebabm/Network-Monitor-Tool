//
//  NetworkService.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import Foundation
import NetKitLocal
import Network

struct NetworkService {
    let service = LocalNetworkService(.client)
    
    func hostConnection() {
        let ipString = "192.168.86.185"
        let port = 49151
        do {
            try service.establishConnection(to: ipString, on: port)
        } catch {
            print(error)
        }
    }
    
    func connectToHost() {
        do {
            try service.hostConnections(on: 49151)
        } catch {
            print(error)
        }
    }
}
