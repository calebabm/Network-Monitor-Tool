//
//  LocalCell.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/6/21.
//

import Foundation

class LocalCell: CellData {
    var state: String
    var host: String
    var clients: [String]
    
    init(title: String, state: String, host: String, client: [String]) {
        self.state = state
        self.host = host
        self.clients = client
        super.init(title: title)
    }
    
}
