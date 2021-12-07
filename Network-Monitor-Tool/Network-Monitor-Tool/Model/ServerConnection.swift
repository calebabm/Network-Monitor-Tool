//
//  ServerCell.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/6/21.
//

import Foundation

class ServerConnection: Identifiable {
    var id = UUID()
    var url: String
    var timeStamp: String
    var requestType: String
    var status: String
    
    init(url: String, timeStamp: String, requestType: String, status: String) {
        self.url = url
        self.timeStamp = timeStamp
        self.requestType = requestType
        self.status = status
    }    
}
