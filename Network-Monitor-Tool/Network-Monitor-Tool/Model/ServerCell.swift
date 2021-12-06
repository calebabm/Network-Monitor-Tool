//
//  ServerCell.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/6/21.
//

import Foundation

class ServerCell: CellData {
    var timeStamp: String
    var requestType: String
    var status: String
    
    init(title: String, timeStamp: String, requestType: String, status: String) {
        self.timeStamp = timeStamp
        self.requestType = requestType
        self.status = status
        super.init(title: title)
    }    
}
